<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateSetting extends FormRequest
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
            'title'           => 'required',
            'user_info'       => 'required',
            'provider_info'   => 'required',
            'facebook'        => 'url|nullable',
//            'snapchat'    => 'url|nullable',
            'insta'           => 'url|nullable',
            'twitter'         => 'url|nullable',
            'tax'             => 'required|integer|min:0|max:100',

        ];
    }
    public function messages(){
        return[
            'title.required'         => 'اسم الشركة مطلوب',
            'user_info.required'     => 'يجب ادخال معلومات مساعدة العميل',
            'provider_info.required' => 'يجب ادخال معلومات مساعدة مقدم الخدمة',
            'facebook.url'           => 'يرجي ادخال رابط فيسبوك صحيح يبدأ ب https://',
//            'snapchat.url'         => 'يرجي ادخال رابط سناب شات صحيح يبدأ ب https://',
            'insta.url'              => 'يرجي ادخال رابط انستجرام صحيح يبدأ ب https://',
            'twitter.url'            => 'يرجي ادخال رابط تويتر صحيح يبدأ ب https://',
            'tax.required'           => 'يرجي ادخال الضريبة',
            'tax.integer'            => 'يرجي ادخال ارقام فقط دون حروف',
            'tax.min'                => 'الحد الادني للضريبة هو 0%',
            'tax.max'                => 'الحد الادني للضريبة هو 100%',
        ];
    }
}
