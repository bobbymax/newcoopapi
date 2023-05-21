<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     */
    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->success(Category::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255|unique:categories'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $category = Category::create($request->except('id'));

        return $this->success($category, 'Category added successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category): \Illuminate\Http\JsonResponse
    {
        return $this->success($category);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $category->update($request->except('id'));

        return $this->success($category, 'Category updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category): \Illuminate\Http\JsonResponse
    {
        $category->delete();
        return $this->success(null, 'Category Deleted successfully!!');
    }
}
