<?php

namespace App\Http\Controllers;

use App\Lesson;
use Illuminate\Http\Request;

class LessonController extends Controller
{
    public function index()
    {
        $lessons = Lesson::all();

        return response()->json($lessons, 200);
    }

    public function show(Lesson $lesson)
    {
        return $lesson;
    }

    public function quizzes(Lesson $lesson)
    {
        return response()->json($lesson->quizzes()->get(), 201);
    }

    public function store(Request $request)
    {
        $lesson =  Lesson::create($request->all());

        return response()->json($lesson, 201);
    }

    public function update(Request $request, Lesson $lesson)
    {
        $lesson->update($request->all());

        return response()->json($lesson, 200);
    }

    public function change(Request $request, Lesson $lesson)
    {
        $lesson->update($request->all());

        return response()->json($lesson, 200);
    }

    public function delete(Lesson $lesson)
    {
        $lesson->delete();

        return response()->json(null, 204);
    }
}
