<?php

namespace App\Http\Controllers;

use App\Course;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function index()
    {
        $courses = Course::all();

        return response()->json($courses, 200);
    }

    public function show(Course $course)
    {
        return $course;
    }

    public function discussion(Course $course)
    {
        return $course;
    }

    public function store(Request $request)
    {
        $course =  Course::create($request->all());

        return response()->json($course, 201);
    }

    public function update(Request $request, Course $course)
    {
        $course->update($request->all());

        return response()->json($course, 200);
    }

    public function status(Request $request, Course $course)
    {
        $course->update($request->all());

        return response()->json($course, 200);
    }

    public function delete(Course $course)
    {
        $course->delete();

        return response()->json(null, 204);
    }
}
