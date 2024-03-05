<?php

namespace App\Http\Controllers;

use App\Http\Resources\SubBudgetHeadResource;
use App\Models\SubBudgetHead;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SubBudgetHeadController extends Controller
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
        return $this->success(SubBudgetHeadResource::collection(SubBudgetHead::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:255|unique:sub_budget_heads',
            'budget_head_id' => 'required|integer',
            'category_id' => 'required|integer',
            'type' => 'required|string|max:255|in:capital,recurrent,personnel',
            'group' => 'required|string|max:255|in:inflow,outflow'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $subBudgetHead = SubBudgetHead::create($request->except('id'));

        return $this->success(new SubBudgetHeadResource($subBudgetHead), 'Sub Budget Head created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(SubBudgetHead $subBudgetHead): \Illuminate\Http\JsonResponse
    {
        return $this->success(new SubBudgetHeadResource($subBudgetHead));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SubBudgetHead $subBudgetHead): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:255',
            'budget_head_id' => 'required|integer',
            'category_id' => 'required|integer',
            'type' => 'required|string|max:255|in:capital,recurrent,personnel',
            'group' => 'required|string|max:255|in:inflow,outflow'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $subBudgetHead->update($request->except('id'));

        return $this->success(new SubBudgetHeadResource($subBudgetHead), 'Sub Budget Head updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SubBudgetHead $subBudgetHead): \Illuminate\Http\JsonResponse
    {
        $subBudgetHead->delete();
        return $this->success(null, 'Sub Budget Head deleted successfully!!');
    }
}
