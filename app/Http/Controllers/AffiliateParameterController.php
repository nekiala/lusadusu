<?php

namespace App\Http\Controllers;

use App\AffiliateParameter;
use Illuminate\Http\Request;

class AffiliateParameterController extends Controller
{
    public function index()
    {
        $parameters = AffiliateParameter::all();

        return response()->json($parameters, 200);
    }

    public function show(AffiliateParameter $parameter)
    {
        return $parameter;
    }

    public function store(Request $request)
    {
        $parameter = AffiliateParameter::create($request->all());

        return response()->json($parameter, 201);
    }

    public function update(Request $request, AffiliateParameter $parameter)
    {
        $parameter->update($request->all());

        return response()->json($parameter, 200);
    }

    public function delete(AffiliateParameter $parameter)
    {
        $parameter->delete();

        return response()->json(null, 204);
    }
}
