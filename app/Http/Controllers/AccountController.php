<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\User;
use App\Models\Organization;
use App\Http\Resources\AccountResource;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class AccountController extends Controller
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
        return $this->success(AccountResource::collection(Account::latest()->get()));
    }

    public function fetchMemberAccounts(User $member): \Illuminate\Http\JsonResponse
    {
        return $this->success(AccountResource::collection($member->accounts));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'bank_name' => 'required|string|max:255',
            'account_number' => 'required|string|max:255|unique:accounts',
            'type' => 'required|string|max:255|in:organization,member,staff',
            'accountable_id' => 'required|integer'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $holder = $this->getAccountHolder($request->type, $request->accountable_id);

        $account = new Account;
        $account->bank_name = $request->bank_name;
        $account->account_number = $request->account_number;
        $holder->accounts()->save($account);

        return $this->success(new AccountResource($account), 'Account has been added successfully!!', 201);
    }

    private function getAccountHolder($type, $holderId)
    {
        return match($type) {
            "organization" => Organization::find($holderId),
            default => User::find($holderId),
        };
    }

    /**
     * Display the specified resource.
     */
    public function show(Account $account): \Illuminate\Http\JsonResponse
    {
        return $this->success(new AccountResource($account));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Account $account): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'bank_name' => 'required|string|max:255',
            'account_number' => 'required|string|max:255|unique:accounts',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $account->update($request->except('type', 'accountable_id'));
        return $this->success(new AccountResource($account), 'Account details have been updated successfully!');
    }

    public function makeAccountDefault(Request $request, Account $account): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'current' => 'required|string|max:255|in:yes',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $member = User::find($request->user_id);

        if (!$member) {
            return $this->error(null, 'Wrong account ID entered', 422);
        }

        $current = $member->account;

        $current?->update([
            'current' => false
        ]);

        $account->update([
            'current' => true
        ]);

        return $this->success(new AccountResource($account), 'This account is now your default account');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Account $account): \Illuminate\Http\JsonResponse
    {
        $account->delete();
        return $this->success(null, 'Account deleted successfully!!');
    }
}
