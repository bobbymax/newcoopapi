<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LoanResource extends JsonResource
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
            'sub_budget_head_id' => $this->sub_budget_head_id,
            'sub_budget_head_name' => $this->subBudgetHead->name,
            'sub_budget_head_code' => $this->subBudgetHead->code,
            'request_code' => $this->request_code,
            'requested_amount' => $this->requested_amount,
            'approved_amount' => $this->approved_amount,
            'member_id' => $this->member->id,
            'member' => $this->member->firstname . " " . $this->member->surname,
            'reason' => $this->reason,
            'capitalSum' => $this->capitalSum,
            'remittance' => $this->remittance,
            'interest_rate' => $this->interest_rate,
            'preferred_tenor' => $this->preferred_tenor,
            'commitment_rate' => $this->commitment_rate,
            'commitment' => $this->commitment,
            'deduction' => $this->deduction,
            'deduction_month' => $this->deduction_month,
            'interestSum' => $this->interestSum,
            'totalPayable' => $this->totalPayable,
            'installments' => $this->installments,
            'guarantors' => GuarantorResource::collection($this->guarantors),
            'status' => $this->status,
            'state' => $this->state,
            'paid' => $this->paid == 1,
            'isArchived' => $this->isArchived == 1,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
