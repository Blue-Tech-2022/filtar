<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ContactUs;
use App\Models\Provider;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class ContactUsController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:عرض تواصل معنا')->only('index');
        $this->middleware('permission:الرد علي تواصل معنا')->only('show','store');
        $this->middleware('permission:حذف تواصل معنا')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
            $contact = ContactUs::orderBy('id','DESC')->get();
            return Datatables::of($contact)
                ->addColumn('action', function ($contact) {
                    $checkEdit = (auth()->guard('admin')->user()->can('الرد علي تواصل معنا')) ? 'display:inline-block' : 'display:none';
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف تواصل معنا')) ? 'display:inline-block' : 'display:none';
                    return '
                            <button style="'.$checkEdit.'" type="button" data-id="' . $contact->id . '" class="btn btn-pill btn-primary-light editBtn"><i class="fa fa-reply"></i></button>
                            <button style="'.$checkDelete.'" class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $contact->id . '" data-title="' . $contact->name . '"><i class="fas fa-trash"></i></button>
                       ';
                })
                ->editColumn('created_at', function ($contact) {
                    return $contact->created_at->diffForHumans();
                })
                ->addColumn('phone', function ($contact) {
                    if($contact->provider)
                        $phone = $contact->provider->phone_code.$contact->provider->phone;
                    else
                        $phone = $contact->user->phone_code.$contact->user->phone;

                    return '<a href = "tel:'.$phone.'"> '.$phone.'</a>';
                })
                ->editColumn('name', function ($contact) {
                    if($contact->provider)
                        $name = $contact->provider->first_name.' '.$contact->provider->last_name;
                    else
                        $name = $contact->user->first_name.' '.$contact->user->last_name;

                    return $name;
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/contact/index');
        }
    }

    public function delete(request $request)
    {
        ContactUs::find($request->id)->delete();
        return response(['message'=>'تمت عملية الحذف بنجاح','status'=>200],200);
    }

    public function show($id)
    {
        $contact = ContactUs::find($id);
        if($contact->provider){
            $user = $contact->provider;
            $type = 'provider';
        }
        else{
            $user = $contact->user;
            $type = 'user';
        }
        return view('Admin/contact.sendForm',compact('user','type'));
    }

    public function store(request $request){
        try {
            if($request->type == 'user')
                fireBase($request->user_id, null, $request->message, '500', null, null);
            elseif($request->type == 'provider')
                fireBase(null, $request->user_id, $request->message, '500', null, null);

            return response()->json([
                'status'=>200,
                'message'=>'تم ارسال الرد للمستخدم'
            ]);
        }
        catch (\Exception $e){
            toastError($e->getMessage());
            return response()->json(['status'=>405]);
        }

    }
}
