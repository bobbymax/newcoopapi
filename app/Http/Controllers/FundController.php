<?php

namespace App\Http\Controllers;

use App\Models\Fund;
use App\Models\SubBudgetHead;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FundController extends Controller
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
        return $this->success(Fund::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'approved_amount' => 'required',
            'booked_balance' => 'required',
            'actual_balance' => 'required',
            'sub_budget_head_id' => 'required|integer',
            'year' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $sub = SubBudgetHead::find($request->sub_budget_head_id);

        if ($sub->fund !== null) {
            return $this->error(null, 'You are not permitted to do this', 403);
        }

        $fund = Fund::create($request->except('id'));
        return $this->success($fund, 'Sub Budget Head Added successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Fund $fund): \Illuminate\Http\JsonResponse
    {
        return $this->success($fund);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Fund $fund): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'approved_amount' => 'required',
            'booked_balance' => 'required',
            'actual_balance' => 'required',
            'sub_budget_head_id' => 'required|integer',
            'year' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $fund->update($request->except('id'));
        return $this->success($fund, 'Fund updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Fund $fund): \Illuminate\Http\JsonResponse
    {
        $fund->delete();
        return $this->success(null, 'Fund deleted successfully!');
    }
}
