<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BatchResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $now  = time();
        $created = strtotime($this->created_at);
        $dateDiff = $now - $created;
        $days = round(($dateDiff / (60 * 60 * 24)), 2);
        return [
            'id' => $this->id,
            'user_id' => $this->user_id,
            'controller' => [
                'name' => $this->controller->firstname . " " . $this->controller->surname,
                'membership_no' => $this->controller->membership_no
            ],
            'code' => $this->code,
            'sub_budget_head_code' => $this->sub_budget_head_code,
            'noOfPayments' => $this->noOfPayments,
            'total_amount' => $this->total_amount,
            'status' => $this->status,
            'closed' => $this->closed,
            'expenditures' => ExpenditureResource::collection($this->expenditures),
            'canBeReversed' => $days < 1,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
