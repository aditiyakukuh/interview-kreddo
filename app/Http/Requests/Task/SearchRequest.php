<?php

namespace App\Http\Requests\Task;

use Illuminate\Foundation\Http\FormRequest;

class SearchRequest extends FormRequest
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
            'priority' => 'nullable|in:low,medium,high',
            'status' => 'nullable|in:pending,in-progress,completed',
            'expires' => 'nullable|in:today,week',
            'text' => 'nullable'
        ];
    }
}
