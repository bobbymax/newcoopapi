<?php

namespace App\Http\Controllers;

use App\Http\Resources\DepositResource;
use App\Models\Deposit;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class DepositController extends Controller
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
        return $this->success(Deposit::where('user_id', Auth::user()->id)->latest()->get());
    }

    public function fetchAll(): \Illuminate\Http\JsonResponse
    {
        return $this->success(DepositResource::collection(Deposit::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'amount' => 'required',
            'trxRef' => 'required|string|max:255|unique:deposits',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $deposit = Deposit::create($request->all());

        $deposit->member->wallet->uncleared = $request->amount;
        $deposit->member->wallet->save();

        return $this->success($deposit, 'Deposit created waiting verification', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Deposit $deposit): \Illuminate\Http\JsonResponse
    {
        return $this->success($deposit);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Deposit $deposit): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|in:verified,failed',
            'resolved' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $deposit->update($request->all());

        if ($deposit->status === "verified") {
            $deposit->member->wallet->savings += $deposit->amount;
        }

        $deposit->member->wallet->uncleared -= $deposit->amount;
        $deposit->member->wallet->save();

        return $this->success(new DepositResource($deposit), 'Deposit updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Deposit $deposit): \Illuminate\Http\JsonResponse
    {
        if ($deposit->status !== "pending") {
            return $this->error(null, 'You cannot delete this transaction!!', 403);
        }

        $deposit->member->wallet->uncleared -= $deposit->amount;
        $deposit->member->wallet->save();

        $deposit->delete();
        return $this->success(null, 'Deposit deleted successfully!');
    }
}
