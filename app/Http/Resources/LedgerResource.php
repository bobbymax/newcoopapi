<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LedgerResource extends JsonResource
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
            'journal_id' => $this->journal_id,
            'account_id' => $this->account_id,
            'amount' => $this->amount,
            'type' => $this->type === "D" ? "Debit" : "Credit",
            'post_date' => $this->post_date,
            'ac_no' => $this->account->account_number,
            'bank' => $this->account->bank_name,
            'status' => $this->status
        ];
    }
}
