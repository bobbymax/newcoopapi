<?php

namespace App\Http\Controllers;

use App\Http\Resources\LoanResource;
use App\Models\Installment;
use App\Models\Loan;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LoanController extends Controller
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
        return $this->success(LoanResource::collection(Loan::where('user_id', Auth::user()->id)->latest()->get()));
    }

    public function loansByCode($code): \Illuminate\Http\JsonResponse
    {
        $loan = Loan::where('request_code', $code)->first();

        if (! $loan) {
            return $this->error(null, 'Loan data not found', 422);
        }
        return $this->success(new LoanResource($loan));
    }

    /**
     * Display a listing of the resource.
     */
    public function registeredLoans(): \Illuminate\Http\JsonResponse
    {
        return $this->success(LoanResource::collection(Loan::where('status', '!=', 'pending')->latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'sub_budget_head_id' => 'required|integer',
            'request_code' => 'required|string|max:255|unique:loans',
            'requested_amount' => 'required',
            'reason' => 'required',
            'capitalSum' => 'required',
            'commitment' => 'required',
            'commitment_rate' => 'required',
            'interestSum' => 'required',
            'interest_rate' => 'required|integer',
            'totalPayable' => 'required',
            'installments' => 'required|array',
            'preferred_tenor' => 'required|integer',
            'remittance' => 'required',
            'deduction' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $loan = Loan::create([
            'user_id' => $request->user_id,
            'sub_budget_head_id' => $request->sub_budget_head_id,
            'request_code' => $request->request_code,
            'requested_amount' => $request->requested_amount,
            'reason' => $request->reason,
            'capitalSum' => $request->capitalSum,
            'commitment' => $request->commitment,
            'interestSum' => $request->interestSum,
            'totalPayable' => $request->totalPayable,
            'interest_rate' => $request->interest_rate,
            'commitment_rate' => $request->commitment_rate,
            'preferred_tenor' => $request->preferred_tenor,
            'remittance' => $request->remittance,
            'deduction' => $request->deduction,
            'status' => $request->status ?? "pending"
        ]);

        if ($loan) {
            foreach ($request->installments as $obj) {
                Installment::create([
                    'loan_id' => $loan->id,
                    'capital' => $obj['capital'],
                    'fee' => $obj['fee'],
                    'interest' => $obj['interest'],
                    'interestSum' => $obj['interestSum'],
                    'balance' => $obj['balance'],
                    'due_date' => Carbon::parse($obj['due_date']),
                ]);
            }
        }

        return $this->success(new LoanResource($loan), 'Loan request created successfully!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Loan $loan): \Illuminate\Http\JsonResponse
    {
        return $this->success(new LoanResource($loan));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Loan $loan): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' => 'required|integer',
            'preferred_tenor' => 'required|integer',
            'approved_amount' => 'required',
            'remittance' => 'required',
            'principal' => 'required',
            'deduction' => 'required',
            'commitment' => 'required',
            'commitment_rate' => 'required',
            'interestSum' => 'required',
            'interest_rate' => 'required|integer',
            'totalPayable' => 'required',
            'installments' => 'required|array',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $loan->update([
            'sub_budget_head_id' => $request->sub_budget_head_id,
            'preferred_tenor' => $request->preferred_tenor,
            'remittance' => $request->remittance,
            'deduction' => $request->deduction,
            'commitment_rate' => $request->commitment_rate,
            'approved_amount' => $request->approved_amount,
            'capitalSum' => $request->principal,
            'commitment' => $request->commitment,
            'interestSum' => $request->interestSum,
            'interest_rate' => $request->interest_rate,
            'totalPayable' => $request->totalPayable,
        ]);

        $loan->installments()->delete();

        foreach ($request->installments as $obj) {
            Installment::create([
                'loan_id' => $loan->id,
                'capital' => $obj['capital'],
                'fee' => $obj['fee'],
                'interest' => $obj['interest'],
                'interestSum' => $obj['interestSum'],
                'balance' => $obj['balance'],
                'due_date' => Carbon::parse($obj['due_date']),
            ]);
        }

        return $this->success(new LoanResource($loan), 'Loan request updated successfully!');
    }

    public function loanResponse(Request $request, Loan $loan): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:approved,denied',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $loan->update([
            'status' => $request->status,
            'approved_amount' => $request->status === "approved" ? ($request->approved_amount > 0 ? $request->approved_amount : $request->requested_amount) : 0
        ]);

        $message = $request->status === "approved" ? "This loan has now been approved" : "This loan has been denied";

        return $this->success(new LoanResource($loan), $message);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Loan $loan): \Illuminate\Http\JsonResponse
    {
        if ($loan->status !== "pending") {
            return $this->error(null, 'You cannot perform this action', 403);
        }

        $loan->delete();
        return $this->success(null, 'Loan deleted successfully');
    }
}
