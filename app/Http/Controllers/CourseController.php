<?php

namespace App\Http\Controllers;

use App\Course;
use App\Http\Resources\CourseCollection;
use Illuminate\Http\Request;
use App\Http\Resources\Course as CourseResource;

class CourseController extends Controller
{
    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $query = Course::query();

        $query->when($request->filled('filter'), function ($query) {

            $filters = explode(',', \request('filter'));
            $find = ['material'];
            $replace = ['material_id'];

            foreach ($filters as $filter) {

                [$criteria, $value] = explode(':', $filter);

                $query->where(str_replace($find, $replace, $criteria), $value);
            }

            return $query;
        });

        $courses = new CourseCollection($query->paginate());

        return response()->json($courses, 200);
    }

    public function show(Course $course)
    {
        return new CourseResource($course);
    }

    public function lessons(Course $course)
    {
        return response()->json($course->lessons, 200);
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
