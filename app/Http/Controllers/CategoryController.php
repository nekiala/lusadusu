<?php

namespace App\Http\Controllers;

use App\Category;
use App\Question;
use App\User;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();

        return response()->json($categories, 200);
    }

    public function user(User $user)
    {
        //$categories = Category::status(1)->select('id', 'name');
        $categories = [];

        foreach (Category::status(1)->select('id', 'name')->get()  as $category) {

            $categories[] = [
                'id' => $category->id,
                'name' => $category->name,
                'tickets' => Question::questionCountByUser($category->id, $user->id)
            ];
        }

        return response()->json($categories, 200);
    }

    public function active()
    {
        $categories = Category::where('status', 1)->get();

        return response()->json($categories, 200);
    }

    public function show(Category $category)
    {
        return $category;
    }

    public function store(Request $request)
    {
        $category =  Category::create($request->all());

        return response()->json($category, 201);
    }

    public function update(Request $request, Category $category)
    {
        $category->update($request->all());

        return response()->json($category, 200);
    }

    public function delete(Category $category)
    {
        $category->delete();

        return response()->json(null, 204);
    }



    public function status(Request $request, Category $category)
    {
        $category->update($request->all());

        return response()->json($category, 200);
    }
}
