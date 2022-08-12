<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CommercialRecords;
use App\Models\Order;
use App\Models\Product;
use App\Models\Provider;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class ProviderController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:عرض التجار')->only('index','profile','show');
        $this->middleware('permission:تعديل التجار')->only('providerActivation');
        $this->middleware('permission:حذف التجار')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
            $providers = Provider::latest()->get();
            return Datatables::of($providers)
                ->addColumn('action', function ($providers) {
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف التجار')) ? 'display:inline-block' : 'display:none';
                    return '
                             <button type="button" title="تفاصيل" data-id="' . $providers->id . '" class="btn btn-pill btn-info-light editBtn"><i class="fa fa-info"></i></button>
                            <button style="'.$checkDelete.'" class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $providers->id . '" data-title="' . $providers->first_name.' '.$providers->last_name . '"><i class="fas fa-trash"></i></button>
                       ';
                })

                ->addColumn('phone', function ($providers) {
                    $phone = $providers->phone_code.$providers->phone;
                    return '<a href = "tel:'.$phone.'"> '.$phone.'</a>';
                })

                ->editColumn('logo', function ($providers) {
                    $name = $providers->first_name.' '.$providers->last_name;
                    $url  = route('providerProfile',$providers->id);
                    $html = "<a class='text-dark fw-bold'  href = '".$url."'>$name</a>";
                    return '
                    <img onclick="window.open(this.src)" src="'.$providers->logo.'" alt="profile-user" class="brround  avatar-sm w-32 ml-2"> '.$html
                        ;
                })
                ->editColumn('status', function ($providers) {
                    if($providers->status == 0)
                        $span = '<span style="cursor: pointer" data-id="'.$providers->id.'" class="badge badge-danger statusSpan">محظور</span';
                    else
                        $span = '<span style="cursor: pointer" data-id="'.$providers->id.'"  class="badge badge-success statusSpan">مفعل</span';

                    return $span;
                })


                ->editColumn('address', function ($providers) {
                    if($providers->address != null)
                        return $providers->address;
                    else
                        return 'لم يتم الإدخال';
                })

                ->editColumn('country_id', function ($providers) {
                    $gov = ($providers->governorate->governorate_name_ar) ?? '--';
                    $cou = ($providers->country->title_ar) ?? '--';
                    return $gov.' - '.$cou;
                })

                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/provider/index');
        }
    }

    public function providerActivation(Request $request)
    {
        $provider = Provider::find($request->id);
        ($provider->status == '0') ? $provider->status = '1' : $provider->status = '0';
        $provider->save();
        return response()->json(
            [
                'success' => true,
                'message' => 'تم تغيير حالة التاجر بنجاح'
            ]);
    }

    public function show($id){
        $provider = Provider::findOrFail($id);
        return view('Admin/provider/details',compact('provider'));
    }

    public function delete(request $request)
    {
        $provider = Provider::findOrFail($request->id);
        if (file_exists($provider->getAttributes()['logo']))
            unlink($provider->getAttributes()['logo']);

        $provider->delete();
        return response(['message'=>'تمت عملية الحذف بنجاح','status'=>200],200);
    }

    public function profile($id){
        $provider         = Provider::findOrFail($id);
        $new_orders       = Order::where([['provider_id',$id],['status','new']])->count();
        $ended_orders     = Order::where([['provider_id',$id],['status','accepted_by_provider']])->count();
        $canceled_orders  = Order::where([['provider_id',$id],['status','refused_by_provider']])->count();
        $total_money      = Order::where([['provider_id',$id],['status','accepted_by_provider']])->sum('total');
        $active_pro       = Product::where([['provider_id',$id],['status','1']])->count();
        $unActive_pro     = Product::where([['provider_id',$id],['status','0']])->count();
        $allProducts      = Product::where('provider_id',$id)->get();
        return view('Admin.provider.profile',compact('allProducts','provider','total_money','active_pro','unActive_pro','new_orders','ended_orders','canceled_orders'));
    }

}
