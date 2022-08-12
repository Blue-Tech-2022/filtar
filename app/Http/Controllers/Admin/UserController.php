<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:عرض العملاء')->only('index');
        $this->middleware('permission:حذف العملاء')->only('delete');
    }

    public function index(request $request)
    {
        if ($request->ajax()) {
            $data = User::orderBy('id', 'DESC')->get();
            return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    return '
                            <button class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $data->id . '" data-title="' . $data->first_name . ' ' . $data->last_name . '"><i class="fas fa-trash"></i></button>
                       ';
                })
                ->editColumn('image', function ($data) {
                    return '
                    <img onclick="window.open(this.src)" src="'.$data->image.'" alt="profile-user" class="brround  avatar-sm w-32 ml-2"> '.$data->first_name.' '.$data->last_name
                        ;
                })
                ->editColumn('created_at', function ($data) {
                    return $data->created_at->diffForHumans();
                })
                ->editColumn('phone', function ($data) {
                    $phone = $data->phone_code . $data->phone;
                    return '<a href = "tel:' . $phone . '"> ' . $phone . '</a>';
                })
                ->editColumn('address', function ($data) {
                    $gov = ($data->governorate->governorate_name_ar) ?? '';
                    $cou = ($data->country->title_ar) ?? $data->address;
                    return $gov.' - '.$cou;
                })
                ->addColumn('filter', function ($data){
                    if($data->water_type == 'good')
                        $type =  'جيدة';
                    else if($data->water_type == 'medium')
                        $type =  'متوسطة';
                    else if($data->water_type == 'bad')
                        $type =  'رديئة';
                    else
                        $type =  null;

                    if($type != null)
                        return 'جودة المياه '.$type.' وعدد الشمعات '.$data->candle_number;

                    else
                        return 'لم يسجل بيانات';

                })
                ->escapeColumns([])
                ->make(true);
        } else {
            return view('Admin/users/index');
        }
    }

    public function delete(request $request)
    {
        User::where('id', $request->id)->delete();
        return response(['message' => 'تمت عملية الحذف بنجاح', 'status' => 200], 200);
    }
}
