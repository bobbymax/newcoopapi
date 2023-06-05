<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DepositResource extends JsonResource
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
            'trxRef' => $this->trxRef,
            'amount' => $this->amount,
            'status' => $this->status,
            'resolved' => $this->resolved == 1,
            'member' => $this->member->firstname . " " . $this->member->surname,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
