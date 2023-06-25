<?php

namespace App\Http\Controllers;

use App\Http\Resources\InstallmentResource;
use App\Models\Account;
use App\Models\ChartOfAccount;
use App\Models\Expenditure;
use App\Models\Installment;
use App\Models\Journal;
use App\Models\Ledger;
use App\Models\SubBudgetHead;
use App\Models\Transaction;
use App\Models\User;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class InstallmentController extends Controller
{
    use HttpResponses;

    protected $data = [];

    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     */
    public function index(): \Illuminate\Http\JsonResponse
    {
        $installments = Installment::whereYear('due_date', now()->year)->whereMonth('due_date', now()->month)->latest()->get();

        return $this->success(InstallmentResource::collection($installments));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' =>'required|integer',
            'credit_account_id' =>'required|integer',
            'chart_of_account_id' =>'required|integer',
            'data' =>'required|array',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), "Please fix the following errors:", 500);
        }

        $subBudgetHead = SubBudgetHead::find($request->sub_budget_head_id);
        $debit = Account::find($request->credit_account_id);
        $chart = ChartOfAccount::find($request->chart_of_account_id);

        if (!($subBudgetHead && $debit && $chart)) {
            return $this->error(null, "No record found", 422);
        }

        foreach ($request->data as $obj) {
            $member = User::where('membership_no', $obj['membership_no'])->first();
            $installment = Installment::find($obj['id']);

            if ($member && $member->account !== null && $installment) {
                $expenditure = new Expenditure;
                $expenditure->user_id = Auth::user()->id;
                $expenditure->sub_budget_head_id = $subBudgetHead->id;
                $expenditure->trxRef = "EXP" . $member->membership_no . time();
                $expenditure->beneficiary = $subBudgetHead->name;
                $expenditure->amount = $obj['amount'];
                $expenditure->type = "inflow";
                $expenditure->category = "loan";
                $expenditure->method = "electronic";
                $expenditure->payment_type = "member";
                $expenditure->status = "paid";
                $expenditure->description = $member->membership_no . " LOAN REPAYMENT FOR " . Carbon::now()->format('F');

                if ($member->payments()->save($expenditure)) {
                    $journal = Journal::create([
                        'expenditure_id' => $expenditure->id,
                        'chart_of_account_id' => $chart->id,
                        'credit_account_id' => $debit->id,
                        'debit_account_id' => $member->account->id,
                    ]);

                    if ($journal) {
                        Ledger::create([
                            'journal_id' => $journal->id,
                            'account_id' => $member->account->id,
                            'amount' => $expenditure->amount,
                            'type' => 'D',
                            'post_date' => Carbon::now(),
                            'status' => 'fulfilled'
                        ]);

                        Ledger::create([
                            'journal_id' => $journal->id,
                            'account_id' => $debit->id,
                            'amount' => $expenditure->amount,
                            'type' => 'C',
                            'post_date' => Carbon::now(),
                            'status' => 'fulfilled'
                        ]);
                    }

                    $transaction = new Transaction;
                    $transaction->expenditure_id = $expenditure->id;
                    $transaction->type = "DR";
                    $transaction->post_date = Carbon::parse($expenditure->updated_at);
                    $member->transactions()->save($transaction);
//                    if ($member->transactions()->save($transaction)) {
//                        $member->wallet->savings += $obj['amount'];
//                        $member->wallet->save();
//                    }
                }

                $installment->update([
                    'status' => 'paid'
                ]);
                $this->data[] = $installment;
            }
        }

        return $this->success(InstallmentResource::collection($this->data), 'Monthly Deductions carried out successfully!!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Installment $installment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Installment $installment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Installment $installment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Installment $installment)
    {
        //
    }
}
