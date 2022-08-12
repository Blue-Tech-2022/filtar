<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ContactUs;
use App\Models\Country;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\OrderOfferDetails;
use App\Models\Product;
use App\Models\Provider;
use App\Models\Reviews;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index(request $request)
    {
        if($request->start_from != null && $request->end_at != null){
            $startFrom = $request->start_from;
            $endAt   = $request->end_at;
            $startDate = Carbon::createFromFormat('Y-m-d', $request->start_from);
            $endDate = Carbon::createFromFormat('Y-m-d', $request->end_at);
            $data['users_count'] = User::whereBetween('created_at',[$startDate,$endDate])->count();
            $data['orders_sum'] = Order::where('status', 'accepted_by_provider')->whereBetween('created_at',[$startDate,$endDate])->sum('total');
            $data['provider_count'] = Provider::whereBetween('created_at',[$startDate,$endDate])->count();
            $data['contact_count'] = ContactUs::whereBetween('created_at',[$startDate,$endDate])->count();
            $best_markets = Order::where('status','accepted_by_provider')->whereBetween('created_at',[$startDate,$endDate])
                ->select('provider_id',DB::raw('SUM(total) as total_sales'))
                ->groupBy('provider_id')
                ->orderBy('total_sales','DESC')
                ->get()
                ->take(5);
            $best_products = OrderDetails::whereBetween('created_at',[$startDate,$endDate])->whereHas('order', function ($q) {
                $q->where('status','accepted_by_provider');
            })->select('product_id',DB::raw('SUM(total_price) as total'),DB::raw('count(*) as appear'))
                ->groupBy('product_id')
                ->orderBy('total','DESC')
                ->get()
                ->take(5);
        }
        else{
            $startFrom = null;
            $endAt = null;
            $data['users_count'] = User::count();
            $data['orders_sum'] = Order::where('status', 'accepted_by_provider')->sum('total');
            $data['provider_count'] = Provider::count();
            $data['contact_count'] = ContactUs::count();

            $best_markets = Order::where('status','accepted_by_provider')
                ->select('provider_id',DB::raw('SUM(total) as total_sales'))
                ->groupBy('provider_id')
                ->orderBy('total_sales','DESC')
                ->get()
                ->take(5);
            $best_products = OrderDetails::whereHas('order', function ($q) {
                $q->where('status','accepted_by_provider');
            })->select('product_id',DB::raw('SUM(total_price) as total'),DB::raw('count(*) as appear'))
                ->groupBy('product_id')
                ->orderBy('total','DESC')
                ->get()
                ->take(5);
        }
        $data['active_products_count'] = Product::where('status', '1')->count();
        $data['inactive_products_count'] = Product::where('status', '0')->count();
        if($data['active_products_count'] != 0)
            $data['diff'] = $data['inactive_products_count']/$data['active_products_count'];
        else
            $data['diff'] = 1;
        $countries = Country::whereHas('users')->orWhereHas('providers')->get();
        $orders   = Order::select('id', 'created_at')
            ->get()
            ->groupBy(function ($date) {
                return Carbon::parse($date->created_at)->format('m');
            });
        $usermcount = [];
        $userArr    = [];
        foreach ($orders as $key => $value) {
            $usermcount[(int)$key] = count($value);
        }
        $month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        for ($i = 1; $i <= 12; $i++) {
            if (!empty($usermcount[$i])) {
                $userArr[$i]['count'] = $usermcount[$i];
            } else {
                $userArr[$i]['count'] = 0;
            }
            $userArr[$i]['month'] = $month[$i - 1];
        }
        $clients_orders = array_values($userArr);
        return view('Admin/index',compact('data','startFrom','endAt','clients_orders','best_markets','best_products','countries'));
    }
}
