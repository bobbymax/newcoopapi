<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\Account;
use App\Models\ChartOfAccount;
use App\Models\Expenditure;
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

class AdminController extends Controller
{
    use HttpResponses;

    protected $data = [];

    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function creditMembers(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' =>'required|integer',
            'debit_account_id' =>'required|integer',
            'chart_of_account_id' =>'required|integer',
            'data' =>'required|array',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), "Please fix the following errors:", 500);
        }

        $subBudgetHead = SubBudgetHead::find($request->sub_budget_head_id);
        $debit = Account::find($request->debit_account_id);
        $chart = ChartOfAccount::find($request->chart_of_account_id);

        if (!($subBudgetHead && $debit && $chart)) {
            return $this->error(null, "No record found", 422);
        }

        foreach ($request->data as $obj) {
            $member = User::where('membership_no', $obj['membership_no'])->first();

            if ($member && $member->account !== null) {

                $expenditure = new Expenditure;
                $expenditure->user_id = Auth::user()->id;
                $expenditure->sub_budget_head_id = $subBudgetHead->id;
                $expenditure->trxRef = $this->generateBarcodeNumber(5);
                $expenditure->beneficiary = $member->firstname . " " . $member->surname;
                $expenditure->amount = $obj['amount'];
                $expenditure->type = "outflow";
                $expenditure->category = "contribution";
                $expenditure->method = "electronic";
                $expenditure->payment_type = "member";
                $expenditure->status = "paid";
                $expenditure->description = $member->membership_no . " CONTRIBUTION PAYMENT FOR THE MONTH OF " . Carbon::now()->format('F');

                if ($member->payments()->save($expenditure)) {
                    $fund = $expenditure->fund();
                    $fund->booked_expenditure += $expenditure->amount;
                    $fund->booked_balance -= $expenditure->amount;
                    $fund->save();

                    $journal = Journal::create([
                        'expenditure_id' => $expenditure->id,
                        'chart_of_account_id' => $chart->id,
                        'credit_account_id' => $member->account->id,
                        'debit_account_id' => $debit->id,
                    ]);

                    if ($journal) {
                        Ledger::create([
                            'journal_id' => $journal->id,
                            'account_id' => $debit->id,
                            'amount' => $expenditure->amount,
                            'type' => 'D',
                            'post_date' => Carbon::now(),
                            'status' => 'fulfilled'
                        ]);

                        Ledger::create([
                            'journal_id' => $journal->id,
                            'account_id' => $member->account->id,
                            'amount' => $expenditure->amount,
                            'type' => 'C',
                            'post_date' => Carbon::now(),
                            'status' => 'fulfilled'
                        ]);
                    }

                    $transaction = new Transaction;
                    $transaction->expenditure_id = $expenditure->id;
                    $transaction->type = "CR";
                    $transaction->post_date = Carbon::parse($expenditure->updated_at);

                    if ($member->transactions()->save($transaction)) {
                        $member->wallet->savings += $obj['amount'];
                        $member->wallet->save();
                    }
                }

                $this->data[] = $member;
            }
        }

        return $this->success(UserResource::collection($this->data), 'Credited members successfully');
    }

    private function generateBarcodeNumber($length = 5): string
    {
        $number = mt_rand(1000000000, 9999999999); // better than rand()
        $code = "EXP" . substr($number, 0, 5);

        // call the same function if the barcode exists already
        if ($this->barcodeNumberExists($code)) {
            return $this->generateBarcodeNumber($length);
        }

        // otherwise, it's valid and can be used
        return $code;
    }

    private function barcodeNumberExists($code) {
        return Expenditure::where('trxRef', $code)->first();
    }
}
