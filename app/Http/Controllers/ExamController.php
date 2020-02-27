<?php

namespace App\Http\Controllers;

use App\Exam;
use Illuminate\Http\Request;

class ExamController extends Controller
{
    public function index()
    {
        $exams = Exam::all();

        return response()->json($exams, 200);
    }

    public function show(Exam $exam)
    {
        return $exam;
    }

    public function store(Request $request)
    {
        $exam =  Exam::create($request->all());

        return response()->json($exam, 201);
    }

    public function update(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, 200);
    }

    public function change(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, 200);
    }

    public function delete(Exam $exam)
    {
        $exam->delete();

        return response()->json(null, 204);
    }
}
