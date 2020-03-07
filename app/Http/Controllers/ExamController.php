<?php

namespace App\Http\Controllers;

use App\Assertion;
use App\Exam;
use App\ExamParameter;
use App\Http\Traits\ScoreCalculatorTrait;
use App\Lesson;
use App\Mode;
use App\Question;
use App\Quiz;
use Illuminate\Http\Request;

class ExamController extends Controller
{
    use ScoreCalculatorTrait;

    public function index()
    {
        $exams = Exam::all();

        return response()->json($exams, 200);
    }

    public function show(Exam $exam)
    {
        return $exam;
    }

    public function store(Request $request)
    {
        $exam =  Exam::create($request->all());

        return response()->json($exam, 201);
    }

    public function update(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, 200);
    }

    public function change(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, 200);
    }

    public function delete(Exam $exam)
    {
        $exam->delete();

        return response()->json(null, 204);
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

                return response()->json($exam->lesson()->first(), 200);
            }

            // if the course has started, check if the session has not yet expired
            // the session expiration means that there is no more second
            // for that exam

            if ($exam->started) {


            }
        }

        $lesson = Lesson::randLesson($course_id);
        $mode = Mode::find($mode_id);

        $percentage_required = $mode->winning_average;

        $exam = new Exam;

        $exam->user_id = $user_id;
        $exam->course_id = $course_id;
        $exam->lesson_id = $lesson->id;
        $exam->percentage_required = $percentage_required;

        $exam->save();

        return response()->json($lesson, 200);
    }

    public function start(Exam $exam)
    {
        // first check if exam has already started
        if ($exam->started)
            return response()->json($exam, 201);

        // get quizzes count
        $quizzes = Quiz::where(['lesson_id' => $exam->lesson_id, 'status' => 1])->count();

        // get a random quiz from not already asked quiz list
        $randomQuiz = Quiz::notAsked($exam->id)->inRandomOrder()->first();

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
            $duration = ExamParameter::where('status', 1)->first()->duration;

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

            return response()->json($response, 200);
        }

        return response()->json($exam, 201);
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
}
