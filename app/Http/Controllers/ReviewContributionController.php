<?php

namespace App\Http\Controllers;

use App\Models\ReviewContribution;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ReviewContributionController extends Controller
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
        return $this->success(ReviewContribution::where('user_id', Auth::user()->id)->latest()->get());
    }

    /**
     * Display a listing of the resource.
     */
    public function reviewContributionRequests(): \Illuminate\Http\JsonResponse
    {
        return $this->success(ReviewContribution::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'old_fee' => 'required',
            'new_fee' => 'required',
            'month' => 'required|string|max:255'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the following errors:', 500);
        }

        $reviewContribution = ReviewContribution::create($request->all());
        return $this->success($reviewContribution, 'Contribution review request has been logged successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ReviewContribution $reviewContribution): \Illuminate\Http\JsonResponse
    {
        return $this->success($reviewContribution);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ReviewContribution $reviewContribution): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|max:255|in:approved,denied'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the following errors:', 500);
        }

        $reviewContribution->update([...$request->all(), 'isArchived' => true]);
        return $this->success($reviewContribution, 'Contribution review request has been updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ReviewContribution $reviewContribution): \Illuminate\Http\JsonResponse
    {
        $reviewContribution->delete();
        return $this->success(null, 'Contribution review request has been updated successfully!!');
    }
}
