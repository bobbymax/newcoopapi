<?php

namespace App\Http\Controllers;

use App\Models\Award;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\AwardResource;
use Carbon\Carbon;

class AwardController extends Controller
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
        return $this->success(AwardResource::collection(Award::where('user_id', Auth::user()->id)->latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'organization_id' => 'required|integer',
            'project_id' => 'required|integer',
            'code' => 'required|string|max:255|unique:awards',
            'approved_amount' => 'required',
            'balance' => 'required',
            'date_commenced' => 'required|date',
            'date_awarded' => 'required|date',
            'due_date' => 'required|date',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $award = Award::create([
            'user_id' => $request->user_id,
            'organization_id' => $request->organization_id,
            'project_id' => $request->project_id,
            'code' => $request->code,
            'approved_amount' => $request->approved_amount,
            'balance' => $request->balance,
            'date_awarded' => Carbon::parse($request->date_awarded),
            'date_commenced' => Carbon::parse($request->date_commenced),
            'due_date' => Carbon::parse($request->due_date),
        ]);

        return $this->success(new AwardResource($award), 'Contract Awarded Successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Award $award): \Illuminate\Http\JsonResponse
    {
        return $this->success(new AwardResource($award));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Award $award): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'organization_id' => 'required|integer',
            'project_id' => 'required|integer',
            'approved_amount' => 'required',
            'balance' => 'required',
            'date_awarded' => 'required|date',
            'date_commenced' => 'required|date',
            'due_date' => 'required|date',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $award->update([
            'organization_id' => $request->organization_id,
            'project_id' => $request->project_id,
            'approved_amount' => $request->approved_amount,
            'balance' => $request->balance,
            'date_awarded' => Carbon::parse($request->date_awarded),
            'due_date' => Carbon::parse($request->due_date),
            'date_commenced' => Carbon::parse($request->date_commenced),
        ]);

        return $this->success(new AwardResource($award), 'Contract updated successfully!!');
    }

    public function endContract(Request $request, Award $award): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|in:completed,overdue',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $award->update([
            'status' => $request->status,
            'date_closed' => Carbon::now(),
            'closed' => true
        ]);

        return $this->success(new AwardResource($award), 'Contract has been closed successfully!!');
    }

    public function acceptOrDenyAward(Request $request, Award $award): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|in:accepted,denied',
            'date_accepted_or_denied' => 'required|date',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $award->update([
            'status' => $request->status === "accepted" ? "inprogress" : $request->status,
            'date_accepted_or_denied' => Carbon::parse($request->date_accepted_or_denied),
            'date_commenced' => $request->status === "accepted" ? Carbon::now() : null
        ]);

        return $this->success(new AwardResource($award), 'Contract updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Award $award): \Illuminate\Http\JsonResponse
    {
        $award->delete();
        return $this->success(null, 'Contract deleted successfully!!');
    }
}
