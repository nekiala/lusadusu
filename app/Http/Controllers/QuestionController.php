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

    public function latest($user_id)
    {
        $outputs = [];
        $questions = Question::userLastQuestions($user_id, 1)->select('id', 'category_id', 'subject', 'description', 'status', 'created_at')->get();

        foreach ($questions as $question) {

            $outputs[] = [
                'id' => $question->id,
                'name' => $question->subject,
                'category_name' => $question->category()->select('name')->first()->name,
                'discussions' => $question->discussions()->count(),
                'status' => $question->status,
                'date' => $question->created_at,
                'description' => substr_replace($question->description, '...', 122)
            ];
        }

        return response()->json($outputs, 200);
    }

    public function show(Question $question)
    {
        return $question;
    }

    public function discussion(Question $question)
    {
        return $question->discussions()->get();
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
