<?php

namespace App\Http\Controllers;

use App\Models\Organization;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use Illuminate\Support\Facades\Validator;

class OrganizationController extends Controller
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
        return $this->success(Organization::latest()->get());
    }

    public function owner(): \Illuminate\Http\JsonResponse
    {
        return $this->success(Organization::where('type', 'self')->first());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'reg_no' => 'required|string|max:255|unique:organizations',
            'tin_no' => 'required|string|max:255|unique:organizations',
            'email' => 'required|string|max:255|unique:organizations',
            'code' => 'required|string|max:255|unique:organizations',
            'type' => 'required|string|max:255|in:vendor,self,support',
            'status' => 'required|string|max:255|in:pending,verified',
            'mobile' => 'required|string|max:255|unique:organizations',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $organization = Organization::create($request->except('id'));

        return $this->success($organization, 'Organization created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Organization $organization): \Illuminate\Http\JsonResponse
    {
        return $this->success($organization);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Organization $organization): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'reg_no' => 'required|string|max:255',
            'tin_no' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'type' => 'required|string|max:255|in:vendor,self,support',
            'status' => 'required|string|max:255|in:pending,verified',
            'mobile' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $organization->update($request->except('id', 'code'));
        return $this->success($organization, 'Company details have been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Organization $organization): \Illuminate\Http\JsonResponse
    {
        $organization->delete();
        return $this->success(null, 'Organization deleted successfully!!');
    }
}
