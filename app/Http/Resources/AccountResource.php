<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AccountResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $accType = "App\Models\Organization";
        return [
            'id' => $this->id,
            'bank_name' => $this->bank_name,
            'account_number' => $this->account_number,
            'owner' => $this->accountable_type === $accType ? $this->accountable->name : $this->accountable->firstname . " " . $this->accountable->surname,
            'current' => $this->current == 1,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
