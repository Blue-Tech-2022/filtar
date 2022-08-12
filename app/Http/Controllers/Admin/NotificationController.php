<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Token;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:الاشعارات العامة')->only('index');
    }

    public function index()
    {
        return view('Admin.notification.index');
    }

    public function send(request $request)
    {
        $validator = $request->validate([
            'user_type' => 'required|in:providers,users,all',
            'message' => 'required|max:255',
        ]);

        $tokens = [];
        if ($request->user_type == 'providers') {
            $tokens = Token::where('provider_id', '!=', null)->get();
        } elseif ($request->user_type == 'users'){
            $tokens = Token::where('user_id', '!=', null)->get();
        }
        elseif ($request->user_type == 'all'){
            $tokens = Token::all();
        }

        foreach ($tokens as $row) {
            fireBase($row->user_id, $row->provider_id, $request->message, '500', null, null);
        }

        toastSuccess('تم ارسال الاشعار بنجاح');
        return back();
    }
}
