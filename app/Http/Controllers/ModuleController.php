<?php

namespace App\Http\Controllers;

use App\Http\Resources\ModuleResource;
use App\Models\Module;
use App\Models\Role;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ModuleController extends Controller
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
        return $this->success(ModuleResource::collection(Module::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255|unique:modules',
            'code' => 'required|string|max:255|unique:modules',
            'icon' => 'required|string|max:255',
            'url' => 'required|string|max:255',
            'parentId' => 'required',
            'type' => 'required|string|max:255|in:application,module,page',
            'roles' => 'required|array'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $module = Module::create($request->except('roles', 'id'));

        foreach($request->roles as $ob) {
            $role = Role::find($ob['value']);

            if ($role && !in_array($role->id, $module->roles->pluck('id')->toArray())) {
                $module->roles()->save($role);
            }
        }

        return $this->success(new ModuleResource($module), 'Module created successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Module $module): \Illuminate\Http\JsonResponse
    {
        return $this->success(new ModuleResource($module));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Module $module): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'label' => 'required|string|max:255',
            'code' => 'required|string|max:255',
            'icon' => 'required|string|max:255',
            'url' => 'required|string|max:255',
            'parentId' => 'required',
            'type' => 'required|string|max:255|in:application,module,page',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $module->update($request->all());

        if ($request->roles) {
            foreach ($request->roles as $value) {
                $role = Role::find($value['value']);

                if ($role && ! in_array($role->id, $module->roles->pluck('id')->toArray())) {
                    $module->roles()->save($role);
                }
            }
        }

        return $this->success(new ModuleResource($module), 'Module updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Module $module): \Illuminate\Http\JsonResponse
    {
        $module->delete();
        return $this->success(null, 'Module deleted successfully!!');
    }
}
