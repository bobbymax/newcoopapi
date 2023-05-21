<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NewMemberRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'firstname' => ['required', 'string', 'max:255'],
            'surname' => ['required', 'string', 'max:255'],
            'membership_no' => ['required', 'string', 'max:8', 'unique:users'],
            'staff_no' => ['required', 'string', 'max:8', 'unique:users'],
            'mobile' => ['required', 'string', 'max:8', 'unique:users'],
            'contribution_fee' => ['required'],
            'email' => ['required', 'string', 'max:255', 'unique:users'],
        ];
    }
}
