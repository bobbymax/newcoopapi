<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller
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
        return $this->success(Role::latest()->get());
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255|unique:roles',
            'slot' => 'required|integer'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $role = Role::create($request->all());
        return $this->success($role, 'Role created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Role $role): \Illuminate\Http\JsonResponse
    {
        return $this->success($role);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Role $role): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255|unique:roles',
            'slot' => 'required|integer'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $role->update($request->all());
        return $this->success($role, 'Role updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Role $role): \Illuminate\Http\JsonResponse
    {
        $role->delete();
        return $this->success(null, 'Role deleted successfully');
    }
}
