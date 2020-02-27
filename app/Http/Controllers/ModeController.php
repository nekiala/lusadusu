<?php

namespace App\Http\Controllers;

use App\Mode;
use Illuminate\Http\Request;

class ModeController extends Controller
{
    public function index()
    {
        $modes = Mode::all();

        return response()->json($modes, 200);
    }

    public function show(Mode $mode)
    {
        return $mode;
    }

    public function discussion(Mode $mode)
    {
        return $mode;
    }

    public function store(Request $request)
    {
        $mode =  Mode::create($request->all());

        return response()->json($mode, 201);
    }

    public function update(Request $request, Mode $mode)
    {
        $mode->update($request->all());

        return response()->json($mode, 200);
    }

    public function change(Request $request, Mode $mode)
    {
        $mode->update($request->all());

        return response()->json($mode, 200);
    }

    public function delete(Mode $mode)
    {
        $mode->delete();

        return response()->json(null, 204);
    }
}
