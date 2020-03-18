<?php

namespace App\Http\Controllers;

use App\AccountConfirmation;
use App\Http\Traits\CodeGeneratorTrait;
use App\Mail\ConfirmationCode;
use App\Profile;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ProfileController extends Controller
{
    use CodeGeneratorTrait;

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

    /**
     * This method sends an email to the user with a generated code
     * The user must first provide his phone number, so the system check if
     * there is a corresponding profile. If so, it sends an email
     * @param Request $request
     * @return JsonResponse
     */
    public function check(Request $request)
    {
        $phone_number = trim($request->get('phone_number'));

        if ($profile = Profile::where('phone_number', $phone_number)->first()) {

            // generate a code
            $code = $this->generateAffiliateCode();

            // write to the temporary table
            AccountConfirmation::create([
                'phone_number' => $profile->phone_number,
                'email_address' => $profile->user->email,
                'confirmation_code' => $code,
                'status' => 0
            ]);

            // then send email
            Mail::to($profile->user->email)->queue(new ConfirmationCode($profile->user, $code));

            return response()->json(null, 204);

        }

        return response()->json(null, 404);
    }

    /**
     * This method verify the code provided by the user
     * If that code match to the one sent by email
     * The returns his details
     * @param Request $request
     * @return JsonResponse
     */
    public function verify(Request $request)
    {
        $confirmation_code = trim($request->get('confirmation_code'));

        if ($sentEmailCode = AccountConfirmation::where('confirmation_code', $confirmation_code)->first()) {

            $sentEmailCode->status = 1;
            $sentEmailCode->save();

            // get user details
            $profile = Profile::where('phone_number', $sentEmailCode->phone_number)->first();

            return response()->json([
                'id' => $profile->user->id,
                'api_token' => $profile->user->api_token,
                'email_address' => $profile->user->email,
                'name' => $profile->user->name,
                'profession' => $profile->profession,
                'phone_number' => $profile->phone_number,
                'city_name' => $profile->city->name
            ], 200);

        }

        return response()->json(null, 404);
    }
}
