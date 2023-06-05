<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LiquidationResource extends JsonResource
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
            'name' => $this->member->firstname . " " . $this->member->surname,
            'loan_id' => $this->loan_id,
            'code' => $this->code,
            'amount' => $this->amount,
            'type' => $this->type,
            'status' => $this->status,
            'loan' => $this->loan->request_code,
            'approved_amount' => $this->loan->approved_amount,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
