<?php

namespace App\Http\Controllers;

use App\Question;
use Illuminate\Http\Request;
use App\Http\Resources\Question as QuestionResource;

class QuestionController extends Controller
{
    public function index()
    {
        $query = array_keys(\request()->query());

        if (in_array('descOrder', $query)) {

            if (in_array('unsolved', $query)) {

                $questions = Question::paginateWithByStatusAndByOrderDesc(0);

            } elseif (in_array('solved', $query)) {

                $questions = Question::paginateWithByStatusAndByOrderDesc(1);

            } else {

                $questions = Question::paginateByOrderDesc();
            }

        } else {

            $questions = Question::paginate();
        }

        return response()->json($questions, 200);
    }

    public function latest($user_id, $limit)
    {
        $outputs = [];
        $questions = Question::userLastQuestions($user_id, $limit)->select('id', 'user_id', 'category_id', 'subject', 'description', 'status', 'created_at')->get();

        foreach ($questions as $question) {

            $outputs[] = [
                'id' => $question->id,
                'name' => $question->subject,
                'category_name' => $question->category()->select('name')->first()->name,
                'discussions' => $question->discussions()->count(),
                'status' => $question->status,
                'date' => $question->created_at,
                'cover' => substr_replace($question->description, '...', 122),
                'description' => $question->description,
                'user_id' => $question->user_id,
            ];
        }

        return response()->json($outputs, 200);
    }

    public function show(Question $question)
    {
        return new QuestionResource($question);
    }

    public function discussion(Question $question)
    {
        $discussions = $question->discussions()->get();

        if (!$discussions) {

            return response()->json([], 204);
        }

        $items = [];

        foreach ($discussions as $discussion) {

            $items[] = [
                'id' => intval($discussion->id),
                'owner' => $discussion->user()->first()->name,
                'message' => $discussion->message,
                'date' => $discussion->created_at,
            ];
        }

        return response()->json($items, 200);
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

    public function status(Request $request, Question $question)
    {
        $question->update($request->all());

        return response()->json($question, 200);
    }
}
