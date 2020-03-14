<?php

namespace App\Http\Controllers;

use App\Course;
use App\Material;
use App\User;
use Illuminate\Http\Request;

class MaterialController extends Controller
{
    public function index()
    {
        $materials = Material::all();

        return response()->json($materials, 200);
    }

    /**
     * List all the materials with different courses
     * The mobile app uses this app to synchronize
     * @return \Illuminate\Http\JsonResponse
     */
    public function listWithCourses()
    {
        $materials = [];

        foreach (Material::status(1)->get(['id', 'name']) as $material) {

            $materials[] = [
                "id" => $material->id,
                "name" => $material->name,
                "courses" => $material->courses()->where('status', 1)->count()
            ];
        }

        return response()->json($materials, 200);
    }

    /**
     * This method returns all the courses contained to this material
     * @param Material $material
     * @return \Illuminate\Http\JsonResponse
     */
    public function courses(Material $material)
    {
        return response()->json($material->courses()->get(), 200);
    }

    public function userCourses(Material $material, $user_id)
    {
        return response()->json(Course::userCourses($material->id, $user_id)->get(), 200);
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

    public function stats($user_id)
    {
        $stats = Material::stats($user_id);

        return response()->json($stats, 200);
    }
}
