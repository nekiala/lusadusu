<?php

namespace App\Http\Controllers;

use App\Affiliate;
use App\AffiliateMember;
use App\Balance;
use App\Http\Traits\CodeGeneratorTrait;
use App\Http\Traits\NumberToShortStringTrait;
use Illuminate\Http\Request;

class AffiliateController extends Controller
{
    use CodeGeneratorTrait;

    public function index()
    {
        $affiliates = Affiliate::all();

        return response()->json($affiliates, 200);
    }

    public function show(Affiliate $affiliate)
    {
        return $affiliate;
    }

    public function members(Affiliate $affiliate)
    {
        $members = $affiliate->members();

        return response()->json($members, 200);
    }

    public function member(Request $request)
    {
        $member = AffiliateMember::create($request->all());

        return response()->json($member, 201);
    }

    public function store(Request $request)
    {
        $affiliate =  Affiliate::create([
            'user_id' => $request->get('user_id'),
            'code' => $this->generateAffiliateCode()
        ]);

        return response()->json($affiliate, 201);
    }

    public function update(Request $request, Affiliate $affiliate)
    {
        $affiliate->update($request->all());

        // create a balance account for that user
        // if his account is activated
        if ($affiliate->status) {

            if (!$balance = Balance::where('user_id', $affiliate->user_id)->first()) {

                Balance::create([
                    'user_id' => $affiliate->user_id,
                    'participation_commission' => 0,
                    'victory_commission' => 0,
                    'members' => 0
                ]);
            }

            unset($balance);
        }

        return response()->json($affiliate, 200);
    }

    public function delete(Affiliate $affiliate)
    {
        $affiliate->delete();

        return response()->json(null, 204);
    }
}
