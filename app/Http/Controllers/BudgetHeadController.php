<?php

namespace App\Http\Controllers;

use App\Models\BudgetHead;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BudgetHeadController extends Controller
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
        return $this->success(BudgetHead::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255|unique:budget_heads'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $budgetHead = BudgetHead::create($request->except('id'));

        return $this->success($budgetHead, 'Budget Head added successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(BudgetHead $budgetHead): \Illuminate\Http\JsonResponse
    {
        return $this->success($budgetHead);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, BudgetHead $budgetHead): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $budgetHead->update($request->except('id'));

        return $this->success($budgetHead, 'Budget Head updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BudgetHead $budgetHead): \Illuminate\Http\JsonResponse
    {
        $budgetHead->delete();

        return $this->success(null, 'Budget Head deleted successfully!!');
    }
}
