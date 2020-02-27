<?php

namespace App\Http\Controllers;

use App\Material;
use Illuminate\Http\Request;

class MaterialController extends Controller
{
    public function index()
    {
        $materials = Material::all();

        return response()->json($materials, 200);
    }

    public function courses(Material $material)
    {
        return response()->json($material->courses()->get(), 200);
    }

    public function show(Material $material)
    {
        return $material;
    }

    public function discussion(Material $material)
    {
        return $material;
    }

    public function store(Request $request)
    {
        $material =  Material::create($request->all());

        return response()->json($material, 201);
    }

    public function update(Request $request, Material $material)
    {
        $material->update($request->all());

        return response()->json($material, 200);
    }

    public function status(Request $request, Material $material)
    {
        $material->update($request->all());

        return response()->json($material, 200);
    }

    public function delete(Material $material)
    {
        $material->delete();

        return response()->json(null, 204);
    }
}
