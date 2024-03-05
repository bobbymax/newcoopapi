<?php

namespace App\Http\Controllers;

use App\Http\Resources\ElectronicResource;
use App\Models\Electronic;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ElectronicController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Display a listing of the resource.
     */
    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->success(ElectronicResource::collection(Electronic::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'device' => 'required|string',
            'requested_amount' => 'required',
            'duration' => 'required|integer',
            'code' => 'required|string|max:255|unique:electronics'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors:', 500);
        }

        $electronic = Electronic::create($request->except('id', 'status'));
        return $this->success(new ElectronicResource($electronic), "Purchase request saved successfully!!", 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Electronic $electronic): \Illuminate\Http\JsonResponse
    {
        return $this->success($electronic);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Electronic $electronic): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:approved,denied',
            'approved_amount' => 'required',
            'duration' => 'required|integer'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors:', 500);
        }

        $electronic->update($request->except('id', 'requested_amount', 'code'));
        return $this->success(new ElectronicResource($electronic), "Purchase request saved successfully!!", 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Electronic $electronic): \Illuminate\Http\JsonResponse
    {
        $electronic->delete();
        return $this->success(null, 'Record deleted successfully!!');
    }
}
