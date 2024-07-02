<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class RendvousRequest extends FormRequest
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
            "time"=> "required|string",
            "date"=>"required|string",
            'patient_id' => [
                'required',
                Rule::exists('patients', 'id'),
            ],
            'medic_id' => [
                'required',
                Rule::exists('medics', 'id'),
            ],
        ];
    }
}
