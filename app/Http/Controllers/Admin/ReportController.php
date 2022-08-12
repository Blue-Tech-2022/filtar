<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Models\Governorate;
use App\Models\Order;
use App\Models\Provider;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:عرض التقارير')->only('index','filtarByCountry');
    }

    public function index(){
        $providers = Provider::all();
        $searchCountry = null;
        return view('Admin/report/index',compact('providers','searchCountry'));
    }

    public function filtarByCountry(request $request){
        $providers = Provider::query();

        if($request->has('country_id') && $request->country_id != null){
            $providers->where('country_id',$request->country_id)->get();
            $searchCountry = Country::find($request->country_id);
        }
        if($request->has('governorate_id') && $request->governorate_id != null){
            $providers->where('governorate_id',$request->governorate_id)->get();
        }
        $providers = $providers->get();
        return view('Admin/report/index',compact('providers','searchCountry'));
    }
}
