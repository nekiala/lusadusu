<?php

namespace App\Http\Controllers;

use App\Discussion;
use Illuminate\Http\Request;

class DiscussionController extends Controller
{
    public function index()
    {
        $discussions = Discussion::all();

        return response()->json($discussions, 200);
    }

    public function show(Discussion $discussion)
    {
        return $discussion;
    }

    public function discussion(Discussion $discussion)
    {
        return $discussion;
    }

    public function store(Request $request)
    {
        $discussion =  Discussion::create($request->all());

        return response()->json($discussion, 201);
    }

    public function update(Request $request, Discussion $discussion)
    {
        $discussion->update($request->all());

        return response()->json($discussion, 200);
    }

    public function status(Request $request, Discussion $discussion)
    {
        $discussion->update($request->all());

        return response()->json($discussion, 200);
    }

    public function delete(Discussion $discussion)
    {
        $discussion->delete();

        return response()->json(null, 204);
    }
}
