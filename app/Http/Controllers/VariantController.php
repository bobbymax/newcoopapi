<?php

namespace App\Http\Controllers;

use App\Models\Variant;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VariantController extends Controller
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
        return $this->success(Variant::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'feature_id' => 'required|integer',
            'tenor' => 'required|integer',
            'interest_rate' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $variant = Variant::create($request->all());
        return $this->success($variant, 'Variant has been created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Variant $variant): \Illuminate\Http\JsonResponse
    {
        return $this->success($variant);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Variant $variant): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'feature_id' => 'required|integer',
            'tenor' => 'required|integer',
            'interest_rate' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $variant->update($request->all());
        return $this->success($variant, 'Variant has been updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Variant $variant): \Illuminate\Http\JsonResponse
    {
        $variant->delete();
        return $this->success(null, 'Variant deleted successfully');
    }
}
