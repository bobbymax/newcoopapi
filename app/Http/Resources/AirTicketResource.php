<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AirTicketResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'user_id' => $this->user_id,
            'airplane_id' => $this->airplane_id,
            'name' => $this->member->firstname . " " . $this->member->surname,
            'airline' => $this->airline->name,
            'code' => $this->code,
            'noOfPassengers' => $this->noOfPassengers,
            'amount' => $this->amount,
            'attributes' => [
                'passengers' => $this->passengers,
            ],
            'type' => $this->type,
            'route' => $this->route,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
