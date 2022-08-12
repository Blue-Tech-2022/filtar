<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\Product;
use App\Traits\GeneralTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    use GeneralTrait;

    public function makeOrder(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'                        => 'required|exists:users,id',
            'provider_id'                    => 'required|exists:providers,id',
            'phone'                          => 'nullable|max:255',
            'address'                        => 'nullable|max:255',
            'total'                          => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'details'                        => 'required|array',
            'details.*.product_id'           => 'required|distinct|exists:products,id',
            'details.*.qty'                  => 'required||regex:/^\d+(\.\d{1,2})?$/',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $orderData = $request->only('user_id','provider_id','phone','address','total');
        $orderData['status'] = 'new';

        $order = Order::create($orderData);

        foreach ($request->details as $row) {
            $product_price = Product::find($row['product_id'])->price;
            OrderDetails::create([
                'order_id'    => $order->id,
                'product_id'  => $row['product_id'],
                'price'       => $product_price,
                'qty'         => $row['qty'],
                'total_price' => $product_price * $row['qty'],
            ]);
        }
        userNotify(null,$request->provider_id,$order->id,'هناك طلب جديد لك');
        return $this->returnSuccessMessage('تم انشاء الطلب بنجاح');
    }

//    public function myOrders(request $request){
//        $validator = Validator::make($request->all(), [
//            'user_id'      => 'nullable|exists:users,id',
//            'provider_id'  => 'nullable|exists:providers,id',
//        ]);
//
//        if ($validator->fails())
//            return $this->returnError($validator->getMessageBag(),400);
//
//        if($request->user_id == null && $request->provider_id == null)
//            return $this->returnError('please send an user_id or provider_id',400);
//
//        $order = Order::query()->with(['provider','user','details','details.product']);
//
//        if($request->user_id != null)
//            $order->where('user_id',$request->user_id);
//        elseif ($request->provider_id != null)
//            $order->where('provider_id',$request->provider_id)->where('status','!=','new');
//
//        if($order->get()->count()){
//            $rows = $order->get();
//            foreach ($rows as $row){
//                $row['day'] = Carbon::createFromFormat('Y-m-d H:i:s', $row['created_at'])->format('Y / m / d');
//                $row['time'] = Carbon::createFromFormat('Y-m-d H:i:s', $row['created_at'])->format('g:i A');
//            }
//            return $this->returnData('data',$rows,'Get Successfully');
//        }
//        else
//            return $this->returnError('لا يوجد اي طلبات لك !',405);
//    }

    public function myOrders(request $request){
        $validator = Validator::make($request->all(), [
            'user_id'      => 'nullable|exists:users,id',
            'provider_id'  => 'nullable|exists:providers,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        if($request->user_id == null && $request->provider_id == null)
            return $this->returnError('please send an user_id or provider_id',400);

        $data = Order::with(['provider','user','details','details.product']);
        $order = [];
        if($request->user_id != null){
            $order['previous'] = Order::with(['provider','user','details','details.product'])->where('user_id',$request->user_id)->whereIn('status',['refused_by_provider','accepted_by_provider'])->get();
            $order['current']= Order::with(['provider','user','details','details.product'])->where('user_id',$request->user_id)->whereIn('status',['new'])->get();
        }
        elseif ($request->provider_id != null){
            $order['previous'] = Order::with(['provider','user','details','details.product'])->where('provider_id',$request->provider_id)->whereIn('status',['refused_by_provider','accepted_by_provider'])->get();
            $order['current']= Order::with(['provider','user','details','details.product'])->where('provider_id',$request->provider_id)->whereIn('status',['new'])->get();
        }

        if($data){
//            foreach ($rows as $row){
//                $row['day'] = Carbon::createFromFormat('Y-m-d H:i:s', $row['created_at'])->format('Y / m / d');
//                $row['time'] = Carbon::createFromFormat('Y-m-d H:i:s', $row['created_at'])->format('g:i A');
//            }
            return $this->returnData('data',$order,'Get Successfully');
        }
        else
            return $this->returnError('لا يوجد اي طلبات لك !',405);
    }


    public function updateOrderStatus(request $request){
        $validator = Validator::make($request->all(), [
            'order_id'     => 'required|exists:orders,id',
            'provider_id'  => 'required|exists:providers,id',
            'status'       => 'required:in:accepted_by_provider,refused_by_provider'
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $order = Order::find($request->order_id);

        if($order->provider_id != $request->provider_id)
            return $this->returnError('هذا الطلب غير مسجل مع هذا التاجر',405);

        if($order->status != 'new')
            return $this->returnError('تم تغيير حالة هذا الطلب مسبقا ',406);

        $order->update([
           'status' => $request->status
        ]);
//        return $order;

        if($request->status == 'accepted_by_provider')
            userNotify($order->user_id,null,$order->id,'تم قبول طلبك المسجل برقم #'.$order->id.' بواسطة '.$order->provider->store_name);

        elseif($request->status == 'refused_by_provider')
            userNotify($order->user_id,null,$order->id,'نأسف تم رفض  طلبك المسجل برقم #'.$order->id.' بواسطة '.$order->provider->store_name);

        return $this->returnSuccessMessage('تم تغيير حالة الطلب بنجاح');
    }


    public function orderDetails(request $request){
        $validator = Validator::make($request->all(), [
            'order_id'     => 'required|exists:orders,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $order = Order::with('user','provider','details','details.product')->find($request->order_id);

        return $this->returnData('data',$order,'get success');

    }
}
