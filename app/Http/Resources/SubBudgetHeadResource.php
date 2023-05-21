<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SubBudgetHeadResource extends JsonResource
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
            'budget_head_id' => $this->budget_head_id,
            'budget_head_name' => $this->budgetHead->name,
            'category_id' => $this->category_id,
            'category_name' => $this->category->name,
            'category_label' => $this->category->label,
            'name' => $this->name,
            'code' => $this->code,
            'type' => $this->type,
            'group' => $this->group,
            'fund' => $this->fund !== null,
            'approved_amount' => $this->fund !== null ? $this->fund->approved_amount : 0,
            'booked_expenditure' => $this->fund !== null ?  $this->fund->booked_expenditure : 0,
            'booked_balance' => $this->fund !== null ?  $this->fund->booked_balance : 0,
            'status' => $this->status,
            'year' => $this->fund !== null ?  $this->fund->year : 0,
            'attributes' => [
                'fund' => $this->fund
            ],
            'feature' => new FeatureResource($this->feature),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
