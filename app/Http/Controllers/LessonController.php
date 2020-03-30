<?php

namespace App\Http\Controllers;

use App\Course;
use App\Imports\LessonsImport;
use App\Lesson;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class LessonController extends Controller
{
    public function index()
    {
        $lessons = Lesson::paginate();

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

    public function import(Request $request, Course $course)
    {
        Excel::import(new LessonsImport(), $request->file('import.xlsx'));

        return response()->json(null, 200);
    }
}
