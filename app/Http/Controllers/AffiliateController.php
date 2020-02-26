<?php

namespace App\Http\Controllers;

use App\Affiliate;
use App\AffiliateMember;
use Illuminate\Http\Request;

class AffiliateController extends Controller
{
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
        $affiliate =  Affiliate::create($request->all());

        return response()->json($affiliate, 201);
    }

    public function update(Request $request, Affiliate $affiliate)
    {
        $affiliate->update($request->all());

        return response()->json($affiliate, 200);
    }

    public function delete(Affiliate $affiliate)
    {
        $affiliate->delete();

        return response()->json(null, 204);
    }
}
