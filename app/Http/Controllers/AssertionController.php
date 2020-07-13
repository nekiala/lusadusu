<?php

namespace App\Http\Controllers;

use App\Assertion;
use App\Imports\AssertionsImport;
use App\Imports\LessonsImport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;

class AssertionController extends Controller
{
    public function index()
    {
        $assertions = Assertion::all();

        return response()->json($assertions, 200);
    }

    public function show(Assertion $assertion)
    {
        return $assertion;
    }

    public function store(Request $request)
    {
        $assertion =  Assertion::create($request->all());

        return response()->json($assertion, 201);
    }

    public function update(Request $request, Assertion $assertion)
    {
        $assertion->update($request->all());

        return response()->json($assertion, 200);
    }

    public function change(Request $request, Assertion $assertion)
    {
        $assertion->update($request->all());

        return response()->json($assertion, 200);
    }

    public function delete(Assertion $assertion)
    {
        $assertion->delete();

        return response()->json(null, 204);
    }

    public function import(Request $request, int $quiz_id)
    {
        $path = $request->file('assertions')->store('import');

        Excel::import(new AssertionsImport($quiz_id), $path);

        Storage::delete($path);

        return response()->json(null, 200);
    }
}
