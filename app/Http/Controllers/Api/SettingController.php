<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ContactUs;
use App\Models\Notification;
use App\Models\Order;
use App\Models\Setting;
use App\Traits\GeneralTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{
    use GeneralTrait;

    public function contactUs(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'      => 'nullable|exists:users,id',
            'provider_id'  => 'nullable|exists:providers,id',
            'message'      => 'required',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        if($request->user_id == null && $request->provider_id == null)
            return $this->returnError('please send an user_id or provider_id',400);

        ContactUs::create($request->all());
        return $this->returnSuccessMessage('تم الارسال بنجاح');
    }


    public function notifications(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'      => 'nullable|exists:users,id',
            'provider_id'  => 'nullable|exists:providers,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        if($request->user_id == null && $request->provider_id == null)
            return $this->returnError('please send an user_id or provider_id',400);

        $data = [];
        if($request->user_id != null)
            $data =  Notification::where([['user_id',$request->user_id],['is_read','0']])->get();

        if($request->provider_id != null)
            $data =  Notification::where([['provider_id',$request->provider_id],['is_read','0']])->get();

        foreach ($data as $row){
            $row->update(['is_read' => '1']);
        }


        return $this->returnData('data',$data);
    }

    public function setting(){
        $data = Setting::first();
        return $this->returnData('data',$data);
    }

    public function unReadNotifications(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'      => 'nullable|exists:users,id',
            'provider_id'  => 'nullable|exists:providers,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        if($request->user_id == null && $request->provider_id == null)
            return $this->returnError('please send an user_id or provider_id',400);


        if($request->user_id != null)
            $data =  Notification::where([['user_id',$request->user_id],['is_read','0']])->count();

        if($request->provider_id != null)
            $data =  Notification::where([['provider_id',$request->provider_id],['is_read','0']])->count();


        return $this->returnData('data',$data);
    }

    public function deleteAllNotifications(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'      => 'nullable|exists:users,id',
            'provider_id'  => 'nullable|exists:providers,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        if($request->user_id == null && $request->provider_id == null)
            return $this->returnError('please send an user_id or provider_id',400);


        if($request->user_id != null)
            Notification::where('user_id',$request->user_id)->delete();

        if($request->provider_id != null)
            Notification::where('provider_id',$request->provider_id)->delete();


        return $this->returnSuccessMessage('تم حذف جميع الاشعارات',);

    }

    public function myStatitistc(request $request){
        $validator = Validator::make($request->all(), [
            'provider_id'  => 'required|exists:providers,id',
            'start_at'  => 'nullable|date_format:Y-m-d',
            'end_at'  => 'nullable|date_format:Y-m-d',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);


        if($request->start_at != null && $request->end_at != null){
            $startDate = Carbon::createFromFormat('Y-m-d', $request->start_at);
            $endDate = Carbon::createFromFormat('Y-m-d', $request->end_at);
            $data['accepted_orders'] = Order::where([['provider_id',$request->provider_id],['status','accepted_by_provider']])->whereBetween('created_at',[$startDate,$endDate])->count();
            $data['refused_orders'] = Order::where([['provider_id',$request->provider_id],['status','refused_by_provider']])->whereBetween('created_at',[$startDate,$endDate])->count();
            $data['new_orders'] = Order::where([['provider_id',$request->provider_id],['status','new']])->whereBetween('created_at',[$startDate,$endDate])->count();
            $data['total_sales'] = Order::where([['provider_id',$request->provider_id],['status','accepted_by_provider']])->whereBetween('created_at',[$startDate,$endDate])->sum('total');

        }
        else{
            $data['accepted_orders'] = Order::where([['provider_id',$request->provider_id],['status','accepted_by_provider']])->count();
            $data['refused_orders'] = Order::where([['provider_id',$request->provider_id],['status','refused_by_provider']])->count();
            $data['new_orders'] = Order::where([['provider_id',$request->provider_id],['status','new']])->count();
            $data['total_sales'] = Order::where([['provider_id',$request->provider_id],['status','accepted_by_provider']])->sum('total');

        }

        return $this->returnData('data',$data);



    }
}
