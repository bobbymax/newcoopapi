<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
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
        return $this->success(Setting::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'display_name' => 'required|string|max:255',
            'key' => 'required|string|max:255|unique:settings',
            'input_type' => 'required|string',
            'group' => 'required|string|in:site,admin'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $setting = Setting::create($request->all());
        return $this->success($setting, 'Setting created successfully!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Setting $setting): \Illuminate\Http\JsonResponse
    {
        return $this->success($setting);
    }

    public function configuration(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'state' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $settings = Setting::latest()->get();


        foreach ($settings as $key => $setting) {
            if (isset($request->state[$setting->key])) {
                $setting->value = $request->state[$setting->key];
                $setting->save();
            }
        }

        return $this->success($settings, 'Settings value updated successfully!');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Setting $setting): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'display_name' => 'required|string|max:255',
            'key' => 'required|string|max:255|unique:settings',
            'input_type' => 'required|string',
            'group' => 'required|string|in:site,admin'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $setting->update($request->all());
        return $this->success($setting, 'Setting details updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Setting $setting): \Illuminate\Http\JsonResponse
    {
        $setting->delete();
        return $this->success(null, 'Setting detail deleted successfully');
    }
}
