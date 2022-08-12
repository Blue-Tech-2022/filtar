<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreDeliveryTime extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'from' => 'required|date_format:H:i',
            'to'   => 'required|date_format:H:i|after:from',
        ];
    }

    public function messages()
    {
        return [
            'from.required' => 'يرجي ادخال موعد البداية',
            'to.required'   => 'يرجي ادخال موعد النهاية',
            'to.after'      => 'موعد النهاية يجب ان يكون بعد موعد البدية',
        ];
    }
}
