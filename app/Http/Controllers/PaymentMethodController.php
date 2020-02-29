<?php

namespace App\Http\Controllers;

use App\PaymentMethod;
use Illuminate\Http\Request;

class PaymentMethodController extends Controller
{
    public function index()
    {
        $methods = PaymentMethod::all();

        return response()->json($methods, 200);
    }

    /**
     * List all the materials with different courses
     * The mobile app uses this app to synchronize
     * @return \Illuminate\Http\JsonResponse
     */
    public function active()
    {
        $methods = PaymentMethod::status(1)->get(['id', 'prefix']);

        return response()->json($methods, 200);
    }

    public function show(PaymentMethod $method)
    {
        return $method;
    }

    public function store(Request $request)
    {
        $method =  PaymentMethod::create($request->all());

        return response()->json($method, 201);
    }

    public function update(Request $request, PaymentMethod $method)
    {
        $method->update($request->all());

        return response()->json($method, 200);
    }

    public function change(Request $request, PaymentMethod $method)
    {
        $method->update($request->all());

        return response()->json($method, 200);
    }

    public function delete(PaymentMethod $method)
    {
        $method->delete();

        return response()->json(null, 204);
    }
}
