<?php

namespace App\Http\Controllers;

use App\Models\Contribution;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ContributionController extends Controller
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
        return $this->success(Auth::user()->contributions);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'fee' => 'required',
            'month' => 'required|string|max:255|in:january,february,march,april,may,june,july,august,september,october,november,december'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $contribution = Contribution::create($request->all());
        return $this->success($contribution, 'Contribution update request created', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Contribution $contribution): \Illuminate\Http\JsonResponse
    {
        return $this->success($contribution);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Contribution $contribution): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'current' => 'required',
            'status' => 'required|string|max:255|in:active,inactive'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix this errors', 500);
        }

        $active = Contribution::where('user_id', $contribution->user_id)->where('status', 'active')->first();

        if ($active && $active->id !== $contribution->id) {
            $active->update([
                'status' => 'inactive',
                'current' => false
            ]);
        }

        $contribution->update($request->all());
        $contribution->member->update([
            'contribution_fee' => $contribution->fee,
        ]);

        return $this->success($contribution, 'Contribution updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Contribution $contribution): \Illuminate\Http\JsonResponse
    {
        if ($contribution->status === "active") {
            return $this->error(null, 'This contribution is still active', 403);
        }

        $contribution->delete();
        return $this->success(null, 'Contribution deleted successfully!!');
    }
}
