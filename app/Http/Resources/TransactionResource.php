<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
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
            'expenditure_id' => $this->expenditure_id,
            'type' => $this->type,
            'payment_type' => $this->type === 'CR' ? 'credit' : 'debit',
            'trxRef' => $this->expenditure->trxRef,
            'beneficiary' => $this->expenditure->beneficiary,
            'description' => $this->expenditure->description,
            'amount' => $this->expenditure->amount,
            'category' => $this->expenditure->category,
            'method' => $this->expenditure->method,
            'attributes' => [
                'benefactor' => $this->transactionable
            ],
            'status' => $this->expenditure->status,
            'posted_at' => $this->post_date,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
