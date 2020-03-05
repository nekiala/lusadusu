<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();

        return response()->json($users, 200);
    }

    public function show(User $user)
    {
        return $user;
    }

    public function profile(User $user)
    {
        return $user->profile()->get();
    }

    public function affiliate($affiliate_code)
    {
        $affiliateUsers = User::where('affiliate_code', $affiliate_code)->get();

        return response()->json($affiliateUsers, 200);
    }

    public function update(Request $request, User $user)
    {
        $user->update($request->all());

        return response()->json($user, 200);
    }

    public function delete(User $user)
    {
        $user->delete();

        return response()->json(null, 204);
    }
}
