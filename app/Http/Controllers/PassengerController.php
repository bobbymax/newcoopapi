<?php

namespace App\Http\Controllers;

use App\Models\Passenger;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PassengerController extends Controller
{
    use HttpResponses;

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'air_ticket_id' => 'required|integer',
            'name' => 'required|string|max:255',
            'type' => 'required|string|max:255|in:adult,child,infant'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $passenger = Passenger::create($request->all());
        return $this->success($passenger, 'Passenger added successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Passenger $passenger): \Illuminate\Http\JsonResponse
    {
        return $this->success($passenger);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Passenger $passenger): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'air_ticket_id' => 'required|integer',
            'name' => 'required|string|max:255',
            'type' => 'required|string|max:255|in:adult,child,infant'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $passenger->update($request->all());
        return $this->success($passenger, 'Passenger details updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Passenger $passenger): \Illuminate\Http\JsonResponse
    {
        $passenger->delete();
        return $this->success(null, 'Passenger deleted successfully');
    }
}
