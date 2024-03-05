<?php

namespace App\Http\Controllers;

use App\Models\Airplane;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AirplaneController extends Controller
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
        return $this->success(Airplane::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $airplane = Airplane::create($request->all());
        return $this->success($airplane, 'Airline created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Airplane $airplane): \Illuminate\Http\JsonResponse
    {
        return $this->success($airplane);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Airplane $airplane): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $airplane->update($request->all());
        return $this->success($airplane, 'Airline updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Airplane $airplane): \Illuminate\Http\JsonResponse
    {
        $airplane->delete();
        return $this->success(null, 'Airline deleted successfully');
    }
}
