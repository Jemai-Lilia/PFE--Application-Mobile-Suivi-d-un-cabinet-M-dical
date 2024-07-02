<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class PatientRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'etat'=>'required|string',
            'user_id' => [
                'required',
                Rule::exists('users', 'id'),
            ],
            'med_id' => [
                'required',
                Rule::exists('doctors', 'id'),
            ],
        ];
    }
}
