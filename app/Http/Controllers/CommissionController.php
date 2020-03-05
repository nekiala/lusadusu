<?php

namespace App\Http\Controllers;

use App\Affiliate;
use App\Commission;
use Illuminate\Http\Request;

class CommissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $commissions = Commission::all();

        return response()->json($commissions, 200);
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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $commission = Commission::create($request->all());

        return response()->json($commission, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Commission $commission
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Commission $commission)
    {
        return response()->json($commission, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Commission $commission
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Commission $commission)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Commission $commission
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Commission $commission)
    {
        $commission->update($request->all());

        return response()->json($commission, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Commission $commission
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete(Commission $commission)
    {
        $commission->delete();

        return response()->json(null, 204);
    }

    public function user($user_id)
    {
        $affiliate = Affiliate::where('user_id', $user_id)->first();

        if (!$affiliate) {

            return response()->json(null, 404);
        }

        $commissions = Commission::where('affiliate_code', $affiliate->code)->get();

        $items = [];

        foreach ($commissions as $commission) {

            $payment = $commission->payment()->first();

            $items[] = [
                'id' => $commission->id,
                'member' =>$payment->user()->first()->name,
                'amount' => $commission->amount,
                'date' => $commission->created_at
            ];

        }

        return response()->json($items, 200);
    }
}
