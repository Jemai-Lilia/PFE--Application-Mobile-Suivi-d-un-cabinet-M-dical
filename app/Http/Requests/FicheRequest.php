<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FicheRequest extends FormRequest
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

            'image'=> 'image|mimes:png,jpeg,svg,jpg|max:5000',
            'Note'=>'string',
            'dossier_id' => [
                'required',
                Rule::exists('dossiers', 'id'),
            ],
        ];
    }
}
