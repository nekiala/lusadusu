<?php

namespace App\Http\Controllers;

use App\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function index()
    {
        $questions = Question::all();

        return response()->json($questions, 200);
    }

    public function show(Question $question)
    {
        return $question;
    }

    public function discussion(Question $question)
    {
        return $question;
    }

    public function store(Request $request)
    {
        $question =  Question::create($request->all());

        return response()->json($question, 201);
    }

    public function update(Request $request, Question $question)
    {
        $question->update($request->all());

        return response()->json($question, 200);
    }

    public function delete(Question $question)
    {
        $question->delete();

        return response()->json(null, 204);
    }
}
