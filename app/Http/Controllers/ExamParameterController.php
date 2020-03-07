<?php

namespace App\Http\Controllers;

use App\ExamParameter;
use Illuminate\Http\Request;

class ExamParameterController extends Controller
{
    public function index()
    {
        $examParameters = ExamParameter::all();

        return response()->json($examParameters, 200);
    }

    public function show(ExamParameter $examParameter)
    {
        return $examParameter;
    }

    public function discussion(ExamParameter $examParameter)
    {
        return $examParameter;
    }

    public function store(Request $request)
    {
        $examParameter =  ExamParameter::create($request->all());

        return response()->json($examParameter, 201);
    }

    public function update(Request $request, Course $course)
    {
        $course->update($request->all());

        return response()->json($course, 200);
    }

    public function status(Request $request, ExamParameter $examParameter)
    {
        $examParameter->update($request->all());

        return response()->json($examParameter, 200);
    }

    public function delete(ExamParameter $examParameter)
    {
        $examParameter->delete();

        return response()->json(null, 204);
    }
}
