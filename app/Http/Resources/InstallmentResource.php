<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InstallmentResource extends JsonResource
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
            'loan_id' => $this->loan_id,
            'capital' => $this->capital,
            'membership_no' => $this->loan->member->membership_no,
            'name' =>$this->loan->member->firstname . " " . $this->loan->member->surname,
            'fee' => $this->fee,
            'interestSum' => $this->interestSum,
            'interest' => $this->interest,
            'balance' => $this->balance,
            'due_date' => $this->due_date,
            'payment_date' => $this->payment_date,
            'status' => $this->status,
            'closed' => $this->closed == 1,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
