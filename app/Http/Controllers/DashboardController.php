<?php

namespace App\Http\Controllers;

use App\Http\Resources\TransactionResource;
use App\Models\Expenditure;
use App\Models\Installment;
use App\Models\Loan;
use App\Models\SubBudgetHead;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function payments(): \Illuminate\Http\JsonResponse
    {
        return $this->success(TransactionResource::collection(Auth::user()->transactions));
    }

    public function index(): \Illuminate\Http\JsonResponse
    {
        $members = User::where('type', 'member')->where('status', 'pending')->latest()->get();
        $budgetHeads = SubBudgetHead::has('fund')->with('fund')->latest()->get();
        $loans = Loan::where('status', 'approved')->where('state', 'active')->where('paid', 1)->latest()->get();
        $expenditures = Expenditure::where('status', '!=', 'reversed')->latest()->get();
        $installments = Installment::where('status', 'paid')->latest()->get();

        return $this->success(compact('members', 'budgetHeads', 'loans', 'expenditures', 'installments'));
    }
}
