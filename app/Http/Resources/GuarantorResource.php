<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GuarantorResource extends JsonResource
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
            'surety' => $this->member->firstname . " " . $this->member->surname,
            'membership_no' => $this->member->membership_no,
            'user_id' => $this->user_id,
            'loan_id' => $this->loan_id,
            'amount' => $this->loan->requested_amount,
            'code' => $this->loan->request_code,
            'reason' => $this->loan->reason,
            'owner' => $this->loan->member->firstname . " " . $this->loan->member->surname,
            'remark' => $this->remark,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
