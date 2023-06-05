<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'firstname' => $this->firstname,
            'middlename' => $this->middlename,
            'surname' => $this->surname,
            'name' => $this->firstname . " " . $this->surname,
            'membership_no' => $this->membership_no,
            'email' => $this->email,
            'contribution_fee' => $this->contribution_fee,
            'mobile' => $this->mobile,
            'type' => $this->type,
            'staff_no' => $this->staff_no,
            'verified' => $this->verified == 1 ? "Verified" : "Not Verified",
            'disabled' => $this->disabled == 1,
            'attributes' => [
                'roles' => $this->roles->pluck('label')->toArray(),
                'wallet' => $this->wallet,
                'loans' => LoanResource::collection($this->loans),
                'accounts' => $this->accounts
            ]
        ];
    }
}
