<?php

namespace App\Http\Controllers;

use App\Models\ChartOfAccount;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ChartOfAccountController extends Controller
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
        return $this->success(ChartOfAccount::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'account_code_id' => 'required|integer',
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:255|unique:chart_of_accounts',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $chartOfAccount = ChartOfAccount::create($request->all());
        return $this->success($chartOfAccount, 'Chart of Account created successfully', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ChartOfAccount $chartOfAccount): \Illuminate\Http\JsonResponse
    {
        return $this->success($chartOfAccount);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ChartOfAccount $chartOfAccount): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'account_code_id' => 'required|integer',
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $chartOfAccount->update($request->all());
        return $this->success($chartOfAccount, 'Chart of Account updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ChartOfAccount $chartOfAccount): \Illuminate\Http\JsonResponse
    {
        $chartOfAccount->delete();
        return $this->success(null, 'Chart of Account deleted successfully!!');
    }
}
