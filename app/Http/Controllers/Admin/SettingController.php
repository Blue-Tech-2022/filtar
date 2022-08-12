<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateSetting;
use App\Models\Setting;
use App\Traits\PhotoTrait;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    use PhotoTrait;
    public function privacy()
    {
        return view('Admin.setting.privacy');
    }

    public function privacyUpdate(request $request)
    {
        if ($request->terms == '<p>&nbsp;</p>' || $request->privacy == '<p>&nbsp;</p>') {
            toastr()->error('يرجي ادخال كل البيانات');
        } else {
            Setting::first()->update($request->only('privacy', 'terms'));
            toastr()->success('تم تحديث البيانات بنجاح');
        }
        return back();
    }

    public function setting(){
            return view('Admin.setting.index');
    }

    public function settingUpdate(UpdateSetting $request){
        $input = $request->except('_token');
        if($request->has('logo'))
            $input['logo'] = $this->saveImage($request->logo,'assets/uploads','file');

        Setting::first()->update($input);
        toastr()->success('تم تحديث البيانات بنجاح');
        return back();
    }
}
