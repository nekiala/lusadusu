<?php

namespace App\Http\Controllers;

use App\Affiliate;
use App\Balance;
use App\User;
use Illuminate\Http\Request;

class BalanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $balances = Balance::all();

        return response()->json($balances, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $balance =  Balance::create($request->all());

        return response()->json($balance, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Commission  $balance
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Balance $balance)
    {
        return response()->json($balance, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Commission  $balance
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Balance $balance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Commission  $balance
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Balance $balance)
    {
        $balance->update($request->all());

        return response()->json($balance, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Commission  $balance
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete(Balance $balance)
    {
        $balance->delete();

        return response()->json(null, 204);
    }

    public function user($user_id)
    {
        $balance = Balance::where('user_id', $user_id)->first();

        // also check affiliates status
        $affiliate = Affiliate::where('user_id', $user_id)->first();

        $affiliate_status = 3;
        $affiliate_code = "";

        if ($affiliate) {

            $affiliate_code = $affiliate->code;
            $affiliate_status = $affiliate->status;
        }

        if (!$balance) {

            return response()->json([
                'affiliate_code' => $affiliate_code,
                'affiliate_status' => $affiliate_status,
                'victory_commission' => 0,
                'participation_commission' => 0,
                'members' => 0
            ], 200);
        }

        $balance->affiliate_code = $affiliate_code;
        $balance->affiliate_status = $affiliate_status;

        return response()->json($balance, 200);
    }
}
