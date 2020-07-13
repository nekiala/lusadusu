<?php

namespace App\Http\Controllers;

use App\Assertion;
use App\Exam;
use App\ExamParameter;
use App\Http\Resources\ExamCollection;
use App\Http\Traits\ScoreCalculatorTrait;
use App\Lesson;
use App\Mode;
use App\Quiz;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\Exam as ExamResource;

class ExamController extends Controller
{
    use ScoreCalculatorTrait;

    public function index()
    {
        $exams = new ExamCollection(Exam::paginate());

        return response()->json($exams, Response::HTTP_OK);
    }

    public function today()
    {
        $exams = new ExamCollection(Exam::today()->paginate());

        return response()->json($exams, Response::HTTP_OK);
    }

    public function show(Exam $exam)
    {
        return new ExamResource($exam);
    }

    public function store(Request $request)
    {
        $exam =  Exam::create($request->all());

        return response()->json($exam, Response::HTTP_CREATED);
    }

    public function update(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, Response::HTTP_OK);
    }

    public function change(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, Response::HTTP_OK);
    }

    public function delete(Exam $exam)
    {
        $exam->delete();

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }

    public function prepare(Request $request)
    {
        $user_id = $request->get('user_id');
        $course_id = $request->get('course_id');
        $mode_id = intval($request->get('mode_id'));

        // first of all, check if the exam doesn't exist already
        $exam = Exam::where(['user_id' => $user_id, 'course_id' => $course_id])->get();

        // if there is an exam
        // then check if it has been started
        if (isset($exam[0])) {

            $exam = $exam[0];

            // if exam has not yet started
            // return the lesson
            if (!$exam->started) {

                $lesson = $exam->lesson()->first();
                $lesson->exam_id = $exam->id;

                return response()->json($lesson, Response::HTTP_OK);
            }

            // if the course has started, check if the session has not yet expired
            // the session expiration means that there is no more second
            // for that exam

            if ($exam->started) {


            }
        }

        $lesson = Lesson::randLesson($course_id);

        if (!isset($lesson->id))
            return response()->json(null, Response::HTTP_NOT_FOUND);

        $mode = Mode::find($mode_id);

        $percentage_required = $mode->winning_average;

        $exam = new Exam;

        $exam->user_id = $user_id;
        $exam->course_id = $course_id;
        $exam->lesson_id = $lesson->id;
        $exam->percentage_required = $percentage_required;

        $exam->save();

        // inject exam_id to lesson
        $lesson->exam_id = $exam->id;

        return response()->json($lesson, Response::HTTP_OK);
    }

    public function start(Request $request, Exam $exam)
    {
        // first check if exam has already started
        if ($exam->started) {

            return (new QuizController())->get($request->merge([
                "exam_id" => $exam->id
            ]));
        }

        // get quizzes count
        $quizzes = Quiz::getActiveCountByLesson($exam->lesson_id, 1);

        // get a random quiz from not already asked quiz list
        $randomQuiz = Quiz::notAsked($exam->id, $exam->lesson_id)->inRandomOrder()->first();

        // check if that quiz exists
        // if yes, then get all the associated assertions
        if ($randomQuiz) {

            // step indicates how many question left to finish the exam
            // we get this step by selecting available questions that
            // are not already used by this user and are still active
            $step = Quiz::alreadyAsked($exam->id)->count();

            // the assertions must be active
            $assertions = Assertion::where(['quiz_id' => $randomQuiz->id, 'status' => 1])->get();

            // setup exam duration
            // the user is supposed to finish his exam within that duration
            $duration = ExamParameter::getDurationFromActiveParameter(1);

            $nowDate = new \DateTime('now');

            $nowDate->modify(sprintf("+%d minutes", $duration));

            // update exam info
            $exam->started = true;
            $exam->started_at = date('Y-m-d H:i:s');
            $exam->duration = $nowDate->format('Y-m-d H:i:s'); // duration for the exam to finish
            $exam->save();

            $response = [
                'items' => $quizzes,
                'quiz_id' => $randomQuiz->id,
                'quiz_name' => $randomQuiz->question,
                'step' => $step + 1,
                'exam_duration' => $duration,
                'exam_id' => $exam->id,
                'assertions' => $assertions,
                'in_seconds' => false // determines if times is already converted in seconds
            ];

            return response()->json($response, Response::HTTP_OK);
        }

        return response()->json($exam, Response::HTTP_CREATED);
    }

    public function close(Exam $exam)
    {

        // close the exam
        // and set score
        $exam->finished_at = date('Y-m-d H:i:s');
        $exam->normal_finish = true;
        $exam->percentage_obtained = $this->getScore($exam);

        $examPassed = $exam->percentage_obtained >= $exam->percentage_required;
        $exam->passed = $examPassed;

        // save the exam
        $exam->save();

        return response()->json([
            'victory' => intval($examPassed),
            'score' => strval($exam->percentage_obtained) . '%'
        ], 201);
    }

    public function stats($user_id)
    {
        $total_exams = Exam::getCountByUser($user_id);
        $success = Exam::getCountByUserAndPassStatus($user_id, 1);
        $fails = Exam::getCountByUserAndPassStatus($user_id, 0);

        return response()->json([
            'overall' => $total_exams,
            'fails' => $fails,
            'successes' => $success
        ], Response::HTTP_CREATED);
    }

    /**
     * This method returns the user's completed exams
     * @param $user_id
     * @param $status
     * @return JsonResponse
     */
    public function completed($user_id, $status)
    {
        if ($status == 3) {

            $finished = Exam::finished($user_id);

        } elseif ($status == 2) {

            $finished = Exam::unfinished($user_id);

        } else {

            $finished = Exam::unstarted($user_id);
        }

        // if there are exams
        // then format the response
        if ($finished->count()) {

            $exams = $finished->get();
            $output = [];

            foreach ($exams as $exam) {

                $exam_code = sprintf("%s.%s.%s", $exam->user_id, date('d'), $exam->id);

                $output[] = [

                    'id' => $exam->id,
                    'code' => $exam_code,
                    'lesson_name' => Lesson::lessonName($exam->lesson_id),
                    'started_at' => $exam->started_at,
                    'created_at' => $exam->created_at,
                    'passed' => boolval($exam->passed),
                    'can_visualize' => boolval($exam->can_visualize),
                    'quiz_count' => 10,
                    'course_id' => $exam->course_id,
                    'percentage_required' => $exam->percentage_required,
                    'percentage_obtained' => $exam->percentage_obtained
                ];
            }

            return response()->json($output, Response::HTTP_OK);

        }

        return response()->json(null, Response::HTTP_NOT_FOUND);
    }
}
