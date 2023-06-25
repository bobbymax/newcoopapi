<?php

namespace App\Http\Controllers;

use App\Http\Resources\LiquidationResource;
use App\Models\Liquidation;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LiquidationController extends Controller
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
        return $this->success(LiquidationResource::collection(Liquidation::where('user_id', Auth::user()->id)->latest()->get()));
    }

    public function getLiquidations(): \Illuminate\Http\JsonResponse
    {
        return $this->success(LiquidationResource::collection(Liquidation::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'loan_id' => 'required|integer',
            'code' => 'required|string|max:255|unique:liquidations',
            'amount' => 'required',
            'type' => 'required|string|max:255|in:partial,complete'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the following errors', 500);
        }

        $liquidation = Liquidation::create($request->all());
        return $this->success(new LiquidationResource($liquidation), 'Liquidation request submitted successfully!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Liquidation $liquidation): \Illuminate\Http\JsonResponse
    {
        return $this->success(new LiquidationResource($liquidation));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Liquidation $liquidation): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:approved,denied'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the following errors', 500);
        }

        $liquidation->update($request->all());
        return $this->success(new LiquidationResource($liquidation), 'Liquidation request updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Liquidation $liquidation): \Illuminate\Http\JsonResponse
    {
        if ($liquidation->status !== "pending") {
            return $this->error(null, 'You cannot perform this action', 403);
        }

        $liquidation->delete();
        return $this->success(null, 'Request deleted successfully!!');
    }
}
