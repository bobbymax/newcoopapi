<?php

namespace App\Http\Controllers;

use App\Http\Resources\BatchResource;
use App\Models\Batch;
use App\Models\Expenditure;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class BatchController extends Controller
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
        return $this->success(BatchResource::collection(Batch::where('user_id', Auth::user()->id)->latest()->get()));
    }

    public function fetchByCode($batch): \Illuminate\Http\JsonResponse
    {
        $batch = Batch::where('code', $batch)->first();
        if (! $batch) {
            $this->success(null);
        }
        return $this->error($batch, 'This Batch number already exists', 422);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'code' => 'required|string|max:255|unique:batches',
            'sub_budget_head_code' => 'required|string|max:10',
            'noOfPayments' => 'required|integer',
            'total_amount' => 'required',
            'expenditures' => 'required|array',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $batch = Batch::create([
            'code' => $request->code,
            'sub_budget_head_code' => $request->sub_budget_head_code,
            'user_id' => Auth::user()->id,
            'noOfPayments' => $request->noOfPayments,
            'total_amount' => $request->total_amount,
        ]);

        if ($batch) {
            foreach($request->expenditures as $obj) {
                $expenditure = Expenditure::find($obj['id']);

                if ($expenditure) {
                    $expenditure->update([
                        'batch_id' => $batch->id,
                        'status' => 'cleared'
                    ]);
                }
            }
        }

        return $this->success(new BatchResource($batch), 'Batch created successfully!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Batch $batch): \Illuminate\Http\JsonResponse
    {
        return $this->success(new BatchResource($batch));
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Batch $batch): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:paid',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        foreach ($batch->expenditures as $exp) {
            $fund = $exp->fund();

            $exp->update([
                'status' => $request->status
            ]);

            $fund->actual_expenditure += $exp->amount;
            $fund->actual_balance -= $exp->amount;
            $fund->save();
        }

        return $this->success(new BatchResource($batch), 'Batch has been updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Batch $batch): \Illuminate\Http\JsonResponse
    {
        foreach($batch->expenditures as $expenditure) {
            $fund = $expenditure->fund();

            if ($fund) {
                $fund->booked_expenditure -= $expenditure->amount;
                $fund->booked_balance += $expenditure->amount;
                $fund->save();
            }

            $expenditure->status = "reversed";
            $expenditure->batch_id = 0;
            $expenditure->save();
        }

        $batch->delete();
        return $this->success(null, 'Batch deleted successfully');
    }
}
