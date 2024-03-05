<?php

namespace App\Http\Controllers;

use App\Http\Resources\ExpenditureResource;
use App\Models\Expenditure;
use App\Models\Organization;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ExpenditureController extends Controller
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
        return $this->success(ExpenditureResource::collection(Expenditure::where('user_id', Auth::user()->id)->latest()->get()));
    }

    public function forBatches(): \Illuminate\Http\JsonResponse
    {
        return $this->success(ExpenditureResource::collection(Expenditure::where('user_id', Auth::user()->id)->where('type', 'outflow')->where('status', 'pending')->latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' => 'required|integer',
            'trxRef' => 'required|string|max:8|unique:expenditures',
            'beneficiary' => 'required',
            'description' => 'required',
            'amount' => 'required',
            'type' => 'required|string|max:255|in:inflow,outflow',
            'category' => 'required|string|max:255|in:loan,deposit,salary,contribution,dividend,other',
            'means' => 'required|string|max:255|in:cash,electronic,check,other',
            'payment_type' => 'required|string|max:255|in:staff,member,third-party',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $expenditure = new Expenditure;
        $expenditure->user_id = Auth::user()->id;
        $expenditure->sub_budget_head_id = $request->sub_budget_head_id;
        $expenditure->trxRef = $request->trxRef;
        $expenditure->beneficiary = $request->beneficiary['label'];
        $expenditure->description = $request->description;
        $expenditure->amount = $request->amount;
        $expenditure->type = $request->type;
        $expenditure->category = $request->category;
        $expenditure->method = $request->means;
        $expenditure->payment_type = $request->payment_type;
        $expenditure->loan_id = $request->loan_id;
        $holder = $this->getHolder($request->payment_type, $request->beneficiary['value']);
        $holder->payments()->save($expenditure);

        if ($expenditure && $expenditure->fund() !== null)
        {
            $fund = $expenditure->fund();
            if ($request->type === "outflow") {
                $fund->booked_expenditure += $expenditure->amount;
                $fund->booked_balance -= $expenditure->amount;
            } else {
                $fund->booked_expenditure -= $expenditure->amount;
                $fund->booked_balance += $expenditure->amount;
            }

            $fund->save();
        }

        return $this->success(new ExpenditureResource($expenditure), 'Expenditure created successfully!!', 201);
    }

    private function getHolder($type, $id)
    {
        return match ($type) {
            "third-party" => Organization::find($id),
            default => User::find($id)
        };
    }

    /**
     * Display the specified resource.
     */
    public function show(Expenditure $expenditure): \Illuminate\Http\JsonResponse
    {
        return $this->success(new ExpenditureResource($expenditure));
    }

    /**
     * Display the specified resource.
     */
    public function fetchByCode($expenditure): \Illuminate\Http\JsonResponse
    {
        $expenditure = Expenditure::where('trxRef', $expenditure)->first();

        if (!$expenditure) {
            return $this->error(null, 'Expenditure does not exist', 422);
        }

        return $this->success(new ExpenditureResource($expenditure));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Expenditure $expenditure): \Illuminate\Http\JsonResponse
    {
        if ($expenditure->batch_id > 0) {
            return $this->error(null, 'You cannot perform this action', 403);
        }

        $fund = $expenditure->fund();

        if ($fund) {
            if ($expenditure->type === "outflow") {
                $fund->booked_expenditure -= $expenditure->amount;
                $fund->booked_balance += $expenditure->amount;
            } else {
                $fund->booked_expenditure += $expenditure->amount;
                $fund->booked_balance -= $expenditure->amount;
            }
            $fund->save();
        }

        $expenditure->delete();
        return $this->success(null, 'Expenditure deleted successfully!!');
    }
}
