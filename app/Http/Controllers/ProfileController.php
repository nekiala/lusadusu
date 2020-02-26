<?php

namespace App\Http\Controllers;

use App\Profile;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function index()
    {
        $discussions = Profile::all();

        return response()->json($discussions, 200);
    }

    public function show(Profile $profile)
    {
        return $profile;
    }

    public function discussion(Profile $profile)
    {
        return $profile;
    }

    public function store(Request $request)
    {
        $profile =  Profile::create($request->all());

        return response()->json($profile, 201);
    }

    public function update(Request $request, Profile $profile)
    {
        $profile->update($request->all());

        return response()->json($profile, 200);
    }

    public function delete(Profile $profile)
    {
        $profile->delete();

        return response()->json(null, 204);
    }
}
