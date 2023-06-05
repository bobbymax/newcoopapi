<?php

namespace App\Http\Controllers;

use App\Http\Resources\LedgerResource;
use App\Models\Ledger;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LedgerController extends Controller
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
        return $this->success(LedgerResource::collection(Ledger::latest()->get()));
    }

    /**
     * Display the specified resource.
     */
    public function show(Ledger $ledger): \Illuminate\Http\JsonResponse
    {
        return $this->success(new LedgerResource($ledger));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Ledger $ledger): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:pending,fulfilled',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $ledger->update($request->all());

        return $this->success(new LedgerResource($ledger), 'This Payment has been updated successfully!!');
    }
}
