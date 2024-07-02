<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class MedicRequest extends FormRequest
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
            'category'=>'string',
        'patient'=>'string',
        'experience'=>'string',
        'bio_data'=>'string',
        'user_id' => [
            'required',
            Rule::exists('users', 'id'),
        ],
        'spec_id' => [
            'required',
            Rule::exists('specialites', 'id'),
        ],
        ];
    }
}
