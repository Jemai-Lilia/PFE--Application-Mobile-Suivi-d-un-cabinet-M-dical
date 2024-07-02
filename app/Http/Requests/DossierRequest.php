<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DossierRequest extends FormRequest
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
            'nom'=>'string',
            'prenom'=>'string',
            'date_naissance'=>'string',
            'sexe'=>'string',
            'tel'=>'integer',
            'email'=>'string',
            'cnam'=>'string',
            'diagnostique'=>'string',
            'medicament'=>'string',
            'synctome'=>'string',
            'description'=>'string',
            'medic_id' => [
                'required',
                Rule::exists('medics', 'id'),
            ],
        ];
    }
}
