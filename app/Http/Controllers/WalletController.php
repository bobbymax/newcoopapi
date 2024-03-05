<?php

namespace App\Http\Controllers;

use App\Models\Wallet;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class WalletController extends Controller
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
        return $this->success(Wallet::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'savings' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $wallet = Wallet::create($request->all());
        return $this->success($wallet, 'Wallet created successfully', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Wallet $wallet): \Illuminate\Http\JsonResponse
    {
        return $this->success($wallet);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Wallet $wallet): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'savings' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $wallet->update($request->all());
        return $this->success($wallet, 'Wallet updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Wallet $wallet): \Illuminate\Http\JsonResponse
    {
        $wallet->delete();
        return $this->success(null, 'Wallet deleted successfully');
    }
}
