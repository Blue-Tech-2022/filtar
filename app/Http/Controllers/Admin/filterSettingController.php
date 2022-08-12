<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CleanTimeCondition;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class filterSettingController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:عرض اعدادت الفلتر')->only('index');
    }

    public function index(request $request){
        if($request->ajax()) {
            $data = CleanTimeCondition::get();
            return Datatables::of($data)
                ->editColumn('water_type', function ($data) {
                    if($data->water_type == 'good')
                        return 'جيدة';
                    else if($data->water_type == 'medium')
                        return 'متوسطة';
                    else if($data->water_type == 'bad')
                        return 'رديئة';
                    else
                        return '--';
                })
                ->editColumn('change_after', function ($data) {
                        return 'بعد '.$data->change_after .' يوم';
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin.filter.index');
        }
    }
}
