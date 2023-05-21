<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExpenditureResource extends JsonResource
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
            'controller' => [
                'id' => $this->controller->id,
                'name' => $this->controller->firstname . " " . $this->controller->surname,
                'membership_no' => $this->controller->membership_no
            ],
            'sub_budget_head_id' => $this->sub_budget_head_id,
            'sub_budget_head_code' => $this->subBudgetHead->code,
            'sub_budget_head_name' => $this->subBudgetHead->name,
            'loan_id' => $this->loan_id,
            'loan' => [
                'id' => $this->loan_id,
                'code' => $this->loan_id > 0 ? $this->loan->request_code : ""
            ],
            'batch_id' => $this->batch_id,
            'trxRef' => $this->trxRef,
            'beneficiary' => $this->beneficiary,
            'description' => $this->description,
            'amount' => $this->amount,
            'type' => $this->type,
            'category' => $this->category,
            'method' => $this->method,
            'payment_type' => $this->payment_type,
            'member_id' => $this->member_id,
            'member' => [
                'id' => $this->member_id,
                'name' => $this->member_id > 0 ? $this->member->firstname . " " . $this->member->surname : ""
            ],
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
