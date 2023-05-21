<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class FeatureResource extends JsonResource
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
            'sub_budget_head_id' => (int) $this->sub_budget_head_id,
            'subBudgetHeadName' => $this->subBudgetHead->name,
            'subBudgetHeadCode' => $this->subBudgetHead->code,
            'frequency' => $this->frequency,
            'max_repayment_tenor' => $this->max_repayment_tenor,
            'percentage_deduction' => (int) $this->percentage_deduction,
            'offer_limit' => $this->offer_limit,
            'payable_from' => $this->payable_from,
            'commitment' => $this->commitment,
            'variants' => $this->variants
        ];
    }
}
