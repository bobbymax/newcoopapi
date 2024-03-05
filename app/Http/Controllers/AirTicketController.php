<?php

namespace App\Http\Controllers;

use App\Http\Resources\AirTicketResource;
use App\Models\AirTicket;
use App\Models\Passenger;
use App\Traits\HttpResponses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AirTicketController extends Controller
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
        return $this->success(AirTicketResource::collection(AirTicket::where('user_id', Auth::user()->id)->latest()->get()));
    }

    public function getPendingTickets(): \Illuminate\Http\JsonResponse
    {
        return $this->success(AirTicketResource::collection(AirTicket::latest()->get()));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer',
            'airplane_id' => 'required|integer',
            'code' => 'required|string|max:8|unique:air_tickets',
            'noOfPassengers' => 'required|integer',
            'type' => 'required|string|max:255|in:local,international',
            'route' => 'required|string|max:255|in:one-way,return,multi-city',
            'from' => 'required|string|max:255',
            'to' => 'required|string|max:255',
            'date_to_takeoff' => 'required|date',
            'period' => 'required|string|max:255|in:morning,afternoon,evening',
            'passengers' => 'required|array'
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $airTicket = AirTicket::create([
            'user_id' => $request->user_id,
            'airplane_id' => $request->airplane_id,
            'code' => $request->code,
            'noOfPassengers' => $request->noOfPassengers,
            'type' => $request->type,
            'route' => $request->route,
            'from' => $request->from,
            'to' => $request->to,
            'date_to_takeoff' => Carbon::parse($request->date_to_takeoff),
            'date_to_destination' => Carbon::parse($request->date_to_destination),
            'period' => $request->period
        ]);

        if ($request->has('passengers')) {

            foreach ($request->passengers as $passenger) {
                Passenger::create([
                    'air_ticket_id' => $airTicket->id,
                    'name' => $passenger['name'],
                    'email' => $passenger['email'],
                    'mobile' => $passenger['mobile'],
                    'type' => $passenger['type']
                ]);
            }
        }

        return $this->success(new AirTicketResource($airTicket), 'Air Ticket request registered successfully!!', 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(AirTicket $airTicket): \Illuminate\Http\JsonResponse
    {
        return $this->success(new AirTicketResource($airTicket));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, AirTicket $airTicket): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required',
            'airplane_id' => 'required|integer',
            'status' => 'required|string|max:255|in:approved,denied',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Please fix the errors', 500);
        }

        $airTicket->update($request->all());
        return $this->success(new AirTicketResource($airTicket), 'Air Ticket updated successfully!!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AirTicket $airTicket): \Illuminate\Http\JsonResponse
    {
        $airTicket->delete();
        return $this->success(null, 'Air Ticket deleted successfully');
    }
}
