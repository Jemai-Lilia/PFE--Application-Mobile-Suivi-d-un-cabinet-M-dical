<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RDVRequest extends FormRequest
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
            'heur' => 'required|max:25|min:2',
            'jour' => 'required|max:25|min:2'
        ];
    }
}
