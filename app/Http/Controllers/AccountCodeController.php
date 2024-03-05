<?php

namespace App\Http\Controllers;

use App\Models\AccountCode;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AccountCodeController extends Controller
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
        return $this->success(AccountCode::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'range' => 'required|string|max:255|unique:account_codes',
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255|unique:account_codes',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $accountCodes = AccountCode::create($request->all());
        return $this->success($accountCodes, 'Account Code created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(AccountCode $accountCode): \Illuminate\Http\JsonResponse
    {
        return $this->success($accountCode);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, AccountCode $accountCode): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'range' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $accountCode->update($request->all());
        return $this->success($accountCode, 'Account Code updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AccountCode $accountCode): \Illuminate\Http\JsonResponse
    {
        $accountCode->delete();
        return $this->success(null, 'Account Code deleted successfully!!');
    }
}
