<?php

namespace App\Http\Controllers;

use App\Answer;
use App\Assertion;
use Illuminate\Http\Request;

class AnswerController extends Controller
{
    public function index()
    {
        $answers = Answer::all();

        return response()->json($answers, 200);
    }

    public function show(Answer $answer)
    {
        return $answer;
    }

    public function store(Request $request)
    {
        // extract request parameters
        $exam_id = intval($request->get('exam_id'));
        $quiz_id = intval($request->get('quiz_id'));
        $assertion_id = intval($request->get('assertion_id'));

        // check if the given answer is correct
        $correct_answer = Assertion::find($assertion_id)->correct_answer;

        Answer::create([
            'exam_id' => $exam_id,
            'quiz_id' => $quiz_id,
            'assertion_id' => $assertion_id,
            'correct_answer' => $correct_answer
        ]);

        return (new QuizController())->get($request);

        //return redirect()->action('QuizController@get')->with(['exam_id' => $exam_id]);
    }

    public function update(Request $request, Answer $answer)
    {
        $answer->update($request->all());

        return response()->json($answer, 200);
    }

    public function change(Request $request, Answer $answer)
    {
        $answer->update($request->all());

        return response()->json($answer, 200);
    }

    public function delete(Answer $answer)
    {
        $answer->delete();

        return response()->json(null, 204);
    }
}
