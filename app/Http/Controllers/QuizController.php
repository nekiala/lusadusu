<?php

namespace App\Http\Controllers;

use App\Quiz;
use Illuminate\Http\Request;

class QuizController extends Controller
{
    public function index()
    {
        $quizzes = Quiz::all();

        return response()->json($quizzes, 200);
    }

    public function show(Quiz $quiz)
    {
        return $quiz;
    }

    public function responses(Quiz $quiz)
    {
        return response()->json($quiz->responses()->get(), 201);
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
}
