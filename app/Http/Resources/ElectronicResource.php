<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ElectronicResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        $name = $this->requisitor->membership_no . " - " . $this->requisitor->firstname . " " . $this->requisitor->surname;
        return [
            'id' => $this->id,
            'requisitor' => $name,
            'code' => $this->code,
            'user_id' => $this->user_id,
            'device' => $this->device,
            'requested_amount' => $this->requested_amount,
            'approved_amount' => $this->approved_amount,
            'duration' => $this->duration,
            'preferred_month' => $this->preferred_month,
            'remark' => $this->remark ?? "",
            'status' => $this->status,
            'closed' => $this->closed == 1,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
