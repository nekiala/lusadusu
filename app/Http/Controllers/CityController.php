<?php

namespace App\Http\Controllers;

use App\City;
use App\Gender;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function index()
    {
        $cities = City::all();

        return response()->json($cities, 200);
    }

    public function show(City $city)
    {
        return $city;
    }

    public function store(Request $request)
    {
        $city = City::create($request->all());

        return response()->json($city, 201);
    }

    public function update(Request $request, City $city)
    {
        $city->update($request->all());

        return response()->json($city, 200);
    }

    public function delete(City $city)
    {
        $city->delete();

        return response()->json(null, 204);
    }
}
