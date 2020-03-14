<?php

namespace App\Http\Controllers;

use App\Affiliate;
use App\AffiliateMember;
use App\City;
use App\Profile;
use App\User;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

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

    public function store(Request $request)
    {
        $user_name = strval($request->user_name);
        $user_email = strval($request->user_email);
        $user_phone = strval($request->user_phone);
        $user_gender = strval($request->user_gender);
        $user_profession = strval($request->user_profession);
        $affiliate_code = strval($request->affiliate_code);

        $gendersArray = [
            'male' => 1,
            'female' => 2
        ];

        if (in_array(strtolower($user_gender ), array_keys($gendersArray))) {

            $user_gender = $gendersArray[strtolower($user_gender)];
        }

        // register user
        $user_data = [
            'name' => $user_name,
            'gender_id' => $user_gender,
            'email' => $user_email,
            'password' => Hash::make($user_phone)
        ];

        if (!$affiliate_code) {

            // if the affiliate code doesn't correspond to any
            // existing data, return 404
            if (!$affiliate = Affiliate::where('code', $affiliate_code)->first()) {

                return response(null, 404);
            }

            $user_data['affiliate_code'] = $affiliate_code;
        }

        try {

            $user = User::create($user_data);

            // if the user is created, then create an affiliate link
            $affiliateMember = AffiliateMember::create([
                'affiliate_id' => $affiliate->id,
                'member_id' => $user->id
            ]);

        } catch (QueryException $exception) {

            return response()->json($exception->getMessage(), 409);
        }

        // save profile data
        $profile_data = [
            'user_id' => $user->id,
            'city_id' => 1,
            'profession' => $user_profession,
            'phone_number' => $user_phone
        ];

        try {

            $profile = Profile::create($profile_data);

        } catch (QueryException $exception) {

            // delete the affiliate member and user
            $affiliateMember->delete();
            $user->delete();
            return response()->json($exception->getMessage(), 409);
        }

        return response([
            'id' => $user->id,
            'api_token' => $user->generateToken(),
            'city_name' => City::find($profile->city_id)->name
        ], 200);
    }
}
