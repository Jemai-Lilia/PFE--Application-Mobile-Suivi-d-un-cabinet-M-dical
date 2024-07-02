<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class PostRequest extends FormRequest
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
            'title'=> 'required|string',
            'image'=> 'image|mimes:png,jpeg,svg,jpg|max:5000',
            'description'=> 'required|string',
            'type'=> 'required|string',
            'user_id' => [
                'required',
                Rule::exists('users', 'id'),
            ]
        ];
    }
}
