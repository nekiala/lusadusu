<?php

namespace App\Http\Controllers;

use App\Answer;
use App\Assertion;
use App\Exam;
use App\ExamParameter;
use App\Http\Traits\ScoreCalculatorTrait;
use App\Quiz;
use Illuminate\Http\Request;

class QuizController extends Controller
{
    use ScoreCalculatorTrait;

    public function index()
    {
        $quizzes = Quiz::all();

        return response()->json($quizzes, 200);
    }

    public function show(Quiz $quiz)
    {
        return $quiz;
    }

    public function assertions(Quiz $quiz)
    {
        return response()->json($quiz->assertions()->get(), 201);
    }

    public function store(Request $request)
    {
        $quiz =  Quiz::create($request->all());

        return response()->json($quiz, 201);
    }

    public function update(Request $request, Quiz $quiz)
    {
        $quiz->update($request->all());

        return response()->json($quiz, 200);
    }

    public function change(Request $request, Quiz $quiz)
    {
        $quiz->update($request->all());

        return response()->json($quiz, 200);
    }

    public function delete(Quiz $quiz)
    {
        $quiz->delete();

        return response()->json(null, 204);
    }

    public function get(Request $request)
    {
        $exam_id = intval($request->get('exam_id'));

        // select the exam
        $exam = Exam::find($exam_id);

        // check if the user exceeded its time
        $finishDate = new \DateTime($exam->duration);
        $nowDate = new \DateTime("now");

        // if time is exceed, close the exam and return the result
        if ($finishDate < $nowDate) {

            $exam->finished_at = date('Y-m-d H:i:s');
            $exam->normal_finish = false;
            $exam->percentage_obtained = $this->getScore($exam);

            $examPassed = $exam->percentage_obtained >= $exam->percentage_required;
            $exam->passed = $examPassed;

            // save the exam
            $exam->save();

            // return the score to th user
            return response()->json([
                'victory' => intval($examPassed),
                'score' => strval($exam->percentage_obtained) . '%'
            ], 201);

        } else {

            //get new time
            $diffDate = $finishDate->diff($nowDate);

            $aDate = new \DateTime($diffDate->format("%H:%i:%s"));

            $time = $aDate->getTimestamp();

            // get new quiz
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

                // setup gaming duration
                // the user is supposed to finish his exam within that duration

                if ($time != 0) {

                    $duration = $time;

                } else {

                    $duration = ExamParameter::where('status', 1)->first()->duration;
                }

                $nowDate = new \DateTime('now');

                $nowDate->modify(sprintf("+%d minutes", $duration));

                $response = [
                    'items' => $quizzes,
                    'quiz_id' => $randomQuiz->id,
                    'quiz_name' => $randomQuiz->question,
                    'step' => $step + 1,
                    'exam_duration' => $duration,
                    'exam_id' => $exam->id,
                    'assertions' => $assertions,
                    'in_seconds' => boolval($time > 0) // determines if times is already converted in seconds
                ];

                return response()->json($response, 200);

            } else {

                // there is no more quiz, close the exam
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

    }
}
