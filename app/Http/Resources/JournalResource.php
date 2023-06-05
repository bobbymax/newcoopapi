<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class JournalResource extends JsonResource
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
            'chart_of_account_id' => $this->chart_of_account_id,
            'credit_account_id' => $this->credit_account_id,
            'debit_account_id' => $this->debit_account_id,
            'debit' => [
                'bank_name' => $this->debit->bank_name,
                'account_number' => $this->debit->account_number,
                'account_name' => $this->getHolder($this->debit->accountable_type, $this->debit->accountable),
            ],
            'credit' => [
                'bank_name' => $this->credit->bank_name,
                'account_number' => $this->credit->account_number,
                'account_name' => $this->getHolder($this->credit->accountable_type, $this->credit->accountable),
            ],
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }

    private function getHolder($accType, $ins)
    {
        return match($accType) {
            "App\Models\Organization" => $ins->name,
            default => $ins->firstname . " " . $ins->surname
        };
    }
}
