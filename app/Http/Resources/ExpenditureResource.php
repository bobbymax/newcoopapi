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
            'sub_budget_head_id' => $this->sub_budget_head_id,
            'sub_budget_head_code' => $this->subBudgetHead->code,
            'sub_budget_head_name' => $this->subBudgetHead->name,
            'loan_id' => $this->loan_id,
            'attributes' => [
                'controller' => [
                    'id' => $this->controller->id,
                    'name' => $this->controller->firstname . " " . $this->controller->surname,
                    'membership_no' => $this->controller->membership_no
                ],
                'loan' => [
                    'id' => $this->loan_id,
                    'code' => $this->loan_id > 0 ? $this->loan->request_code : ""
                ],
                'beneficiary' => $this->getHolder($this->expenditureable_type, $this->expenditureable)
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
            'status' => $this->status,
            'journal' => $this->journal !== null,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }

    private function getHolder($accType, $ins): array
    {
        return match($accType) {
            "App\Models\Organization" => [
                'id' => $ins->id,
                'type' => 'organization',
                'name' => $ins->name,
                'accounts' => $ins->accounts
            ],
            default => [
                'id' => $ins->id,
                'type' => 'member',
                'name' => $ins->firstname . " " . $ins->surname,
                'accounts' => $ins->accounts,
            ]
        };
    }
}
