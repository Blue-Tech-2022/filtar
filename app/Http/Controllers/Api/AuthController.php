<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\City;
use App\Models\Governorate;
use App\Models\Provider;
use App\Models\Country;
use App\Models\Token;
use App\Models\User;
use App\Traits\GeneralTrait;
use App\Traits\PhotoTrait;
use App\Traits\WebpTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
    use WebpTrait,GeneralTrait;

    ################ login ################
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone'      => 'required',
            'phone_code' => 'required',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        else{
            $data = (User::where($request->only(['phone', 'phone_code']))->with('city','governorate')->first()) ?? Provider::where($request->only(['phone', 'phone_code']))->first();
            if (!$data)
                return $this->returnError('تحقق من بيانات الدخول',405);

            if($data->status == '0')
                return $this->returnError('تم حظر حسابك',410);


            return $this->returnData('data', $data);
        }
    }
    #######################################


    ############# user registration ################
    public function user_register(request $request){
        $validator = Validator::make($request->all(), [
            'first_name'      => 'required|max:255',
            'last_name'       => 'required|max:255',
            'image'           => 'nullable|mimes:jpeg,jpg,png,gif,webp',
            'phone_code'      => 'required|max:5',
            'phone'           => 'required|max:20',
            'country_id'      => 'required|exists:countries,id',
            'governorate_id'         => ["required",Rule::exists('governorates','id')
                ->where('country_id',$request->country_id)],
            'address'         => 'nullable',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $check = (User::where($request->only(['phone', 'phone_code']))->first()) ?? Provider::where($request->only(['phone', 'phone_code']))->first();

        if($check)
            return $this->returnError('تم استخدام الهاتف من قبل',405);

        $data = $request->all();

        if($request->has('image') && $request->image != null)
            $data['image'] = $this->saveImage($request->image,'assets/uploads/users','image',100);

        $user = User::create($data);
        return $this->returnData('data',User::with('country','governorate')->find($user->id));
    }
    ###############################################

    ############# user registration ################
    public function provider_register(request $request){
        $validator = Validator::make($request->all(), [
            'logo'                   => 'nullable|mimes:jpeg,jpg,png,gif,webp',
            'first_name'             => 'required|max:255',
            'last_name'              => 'required|max:255',
            'store_name'             => 'required|max:255',
            'phone_code'             => 'required|max:5',
            'phone'                  => 'required|max:20',
            'country_id'             => 'required|exists:countries,id',
            'governorate_id'         => ["required",Rule::exists('governorates','id')
                ->where('country_id',$request->country_id)],
            'nationality_id_image'   => 'required|mimes:jpeg,jpg,png,gif,webp',
            'vat_number'             => 'required|unique:providers,vat_number|max:255',
            'vat_number_image'       => 'required|mimes:jpeg,jpg,png,gif,webp',
            'commercial_number'      => 'required|unique:providers,commercial_number|max:255',
            'commercial_number_image'=> 'required|mimes:jpeg,jpg,png,gif,webp',
            'address'                => 'nullable',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $check = (User::where($request->only(['phone', 'phone_code']))->first()) ?? Provider::where($request->only(['phone', 'phone_code']))->first();

        if($check)
            return $this->returnError('تم استخدام الهاتف من قبل',405);

        $data = $request->all();

        if($request->has('logo') && $request->logo != null)
            $data['logo'] = $this->saveImage($request->logo,'assets/uploads/providers','image',100);

        if($request->has('nationality_id_image') && $request->nationality_id_image != null)
            $data['nationality_id_image'] = $this->saveImage($request->nationality_id_image,'assets/uploads/providers','image',100);

        if($request->has('vat_number_image') && $request->vat_number_image != null)
            $data['vat_number_image'] = $this->saveImage($request->vat_number_image,'assets/uploads/providers','image',100);

        if($request->has('commercial_number_image') && $request->commercial_number_image != null)
            $data['commercial_number_image'] = $this->saveImage($request->commercial_number_image,'assets/uploads/providers','image',100);

        $provider = Provider::create($data);
        return $this->returnData('data', Provider::with('country','governorate')->find($provider->id));
    }
    ###############################################


    ############# updateToken ################
    public function insertToken(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'      => 'nullable|exists:users,id',
            'provider_id'  => 'nullable|exists:providers,id',
            'phone_token'  => 'required',
            'software_type'=>'nullable|in:android,ios',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        if($request->user_id == null && $request->provider_id == null)
            return $this->returnError('please send an user_id or provider_id',400);

        return $this->returnData('data', Token::updateORcreate($request->all()),'تم التحديث بنجاح');
    }
    ###############################################


    ############# Logout ################
    public function logout(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'     => 'nullable|exists:users,id',
            'provider_id' => 'required_if:user_id,=,null|exists:providers,id',
            'phone_token' => 'required',
        ]);
        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        Token::where('phone_token',$request->phone_token)->delete();
        return $this->returnData('data',null,'logout successfully');
    }
    ###############################################

    ############# Governorate ################
    public function governorates(request $request){
        $validator = Validator::make($request->all(), [
            'country_id'  => 'required|exists:countries,id',
        ]);
        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $data = Governorate::where('country_id',$request->country_id)->select('id','governorate_name_ar')->get();
        return $this->returnData('data',$data,'get data successfully');
    }
    ###############################################


    ############# Countries ################
    public function countries(){
        $data = Country::all();
        return $this->returnData('data',$data,'get data successfully');
    }
    ###############################################

    ############# City ################
    public function citiesOfGovernorate(request $request){
        $validator = Validator::make($request->all(), [
            'governorate_id'  => 'required|exists:governorates,id',
        ]);
        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $data = City::where('governorate_id',$request->governorate_id)->select('id','city_name_ar')->get();
        return $this->returnData('data',$data,'get data successfully');
    }
    ###############################################

    ############# provider update ################
    public function updateProviderProfile(request $request){
        $validator = Validator::make($request->all(), [
            'provider_id'            => 'required|exists:providers,id',
            'logo'                   => 'nullable|mimes:jpeg,jpg,png,gif,webp',
            'first_name'             => 'nullable|max:255',
            'last_name'              => 'nullable|max:255',
            'store_name'             => 'nullable|max:255',
            'country_id'             => 'nullable|exists:countries,id',
            'governorate_id'         => 'nullable|exists:governorates,id',
            'address'                => 'nullable',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $data = $request->except('provider_id','logo');

        if($request->has('logo') && $request->logo != null)
            $data['logo'] = $this->saveImage($request->logo,'assets/uploads/providers','image',100);

        Provider::find($request->provider_id)->update($data);
        $provider = Provider::with('country','governorate')->find($request->provider_id);
        return $this->returnData('data', $provider);
    }
    ###############################################

    ############# user update ################
    public function updateUserProfile(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'                => 'required|exists:users,id',
            'image'                  => 'nullable|mimes:jpeg,jpg,png,gif,webp',
            'first_name'             => 'nullable|max:255',
            'last_name'              => 'nullable|max:255',
            'governorate_id'         => 'nullable',
            'address'                => 'nullable',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $data = $request->except('user_id','image');

        if($request->has('image') && $request->image != null)
            $data['image'] = $this->saveImage($request->image,'assets/uploads/users','image',100);

        User::find($request->user_id)->update($data);
        $user = User::with('country','governorate')->find($request->user_id);
        return $this->returnData('data', $user);
    }
    ###############################################

}
