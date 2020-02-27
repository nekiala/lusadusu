<?php

namespace App\Http\Controllers;

use App\Assertion;
use Illuminate\Http\Request;

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
}
