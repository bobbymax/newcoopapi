<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use Illuminate\Support\Facades\Validator;

class ProjectController extends Controller
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
        return $this->success(Project::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'sub_budget_head_id' => 'required|integer',
            'title' => 'required|string',
            'code' => 'required|string|max:255|unique:projects',
            'duration' => 'required|integer',
            'description' => 'required|string|min:5',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $project = Project::create($request->except('id', 'status'));

        return $this->success($project, 'Project created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Project $project): \Illuminate\Http\JsonResponse
    {
        return $this->success($project);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Project $project): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'sub_budget_head_id' => 'required|integer',
            'title' => 'required|string',
            'duration' => 'required|integer',
            'description' => 'required|string|min:5',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $project->update($request->except('id', 'code'));
        return $this->success($project, 'Project updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Project $project): \Illuminate\Http\JsonResponse
    {
        $project->delete();
        return $this->success(null, 'Project deleted successfully!!');
    }
}
