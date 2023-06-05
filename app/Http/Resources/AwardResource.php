<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AwardResource extends JsonResource
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
            'organization_id' => $this->organization_id,
            'project_id' => $this->project_id,
            'code' => $this->code,
            'title' => $this->project->title,
            'officer' => $this->officer->firstname . " " . $this->officer->surname,
            'vendor' => $this->vendor->name,
            'approved_amount' => $this->approved_amount,
            'paid' => $this->paid,
            'balance' => $this->balance,
            'duration' => Carbon::parse($this->due_date)->diffForHumans(),
            'date_awarded' => $this->date_awarded,
            'date_accepted_or_denied' => $this->date_accepted_or_denied,
            'date_commenced' => $this->date_commenced,
            'due_date' => $this->due_date,
            'date_closed' => $this->date_closed,
            'status' => $this->status,
            'closed' => $this->closed == 1,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
