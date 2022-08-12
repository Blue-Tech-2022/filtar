<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class OrderController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:عرض الطلبات')->only('index');
        $this->middleware('permission:حذف الطلبات')->only('delete');
    }

    public function index(request $request)
    {
        if ($request->ajax()) {
            $data = Order::latest()->get();
            return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف الطلبات')) ? 'display:inline-block' : 'display:none';
                    return '
                    <button style="'.$checkDelete.'" type="button" data-id="' . $data->id . '" title="تفاصيل الطلب" class="btn btn-pill btn-success-light detailsBtn"> <i class="fas fa-info"></i></button>
                            <button class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $data->id . '" data-title="' . $data->id . '"> <i class="fas fa-trash"></i>  </button>
                       ';
                })
                ->editColumn('user_id', function ($data) {
                    if ($data->user)
                        return $data->user->first_name . ' ' . $data->user->last_name;
                    else
                        return '<span class="text-danger">تم حذفه</span>';
                })
                ->editColumn('address', function ($data) {
                    return ($data->address) ?? $data->user->address;
                })
                ->editColumn('provider_id', function ($data) {
                    if ($data->provider)
                        return $data->provider->first_name . ' ' . $data->provider->last_name;
                    else
                        return '<span class="text-danger">تم حذفه</span>';
                })
                ->editColumn('created_at', function ($data) {
                    return $data->created_at->diffForHumans();
                })
                ->editColumn('phone', function ($data) {
                    $phone = ($data->phone) ?? $data->user->phone_code.$data->user->phone;
                    return '<a href="tel:' . $phone . '">' . $phone . '</a>';
                })
                ->editColumn('status', function ($data) {
                    if ($data->status == 'new')
                        return '<span class="badge badge-warning">جديد</span>';
                    elseif ($data->status == 'accepted_by_provider')
                        return '<span class="badge badge-success">مقبول</span>';
                    else
                        return '<span class="badge badge-danger">مرفوض</span>';
                })
                ->escapeColumns([])
                ->make(true);
        } else {
            return view('Admin/orders/index');
        }
    }

    public function orderDetails($id){
        $order = Order::find($id);
        return view('Admin/orders/details',compact('order'));
    }





    public function delete(request $request)
    {
        Order::find($request->id)->delete();
        return response(['message'=>'تمت عملية الحذف بنجاح','status'=>200],200);
    }
}
