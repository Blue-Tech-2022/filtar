<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Models\Governorate;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class GovernorateController extends Controller
{

    public function index(request $request,$id)
    {
        if($request->ajax()) {
            $data = Governorate::orderBy('id','DESC')->where('country_id',$id)->get();
            return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    return '
                            <button type="button" data-id="' . $data->id . '" class="btn btn-pill btn-info-light editBtn"><i class="fa fa-edit"></i></button>
                            <button class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $data->id . '" data-title="' . $data->title_ar . '">
                                    <i class="fas fa-trash"></i>
                            </button>
                       ';
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            $country =Country::findOrFail($id);
            return view('Admin/governorate/index',compact('country'));
        }
    }

    public function create($country_id)
    {
        return view('Admin/governorate.parts.create',compact('country_id'));
    }



    public function store(request $request): \Illuminate\Http\JsonResponse
    {
        $request->validate([
            'governorate_name_ar'   => 'required|max:255',
        ],[
            'governorate_name_ar.required'   => 'يرجي ادخال اسم المحافظة',
        ]);
        $data = $request->except('_token');
        if(Governorate::create($data))
            return response()->json(['status'=>200]);
        else
            return response()->json(['status'=>405]);
    }


    public function show($id)
    {
        //
    }


    public function edit($id)
    {
        $row = Governorate::find($id);
        return view('Admin/governorate.parts.edit',compact('row'));
    }



    public function update(Request $request,$id)
    {
        $request->validate([
            'governorate_name_ar'   => 'required|max:255|unique:governorates,governorate_name_ar',
        ],[
            'governorate_name_ar.unique'     => 'اسم المحافظة تم ادخاله مسبقا',
            'governorate_name_ar.required'   => 'يرجي ادخال اسم المحافظة',
        ]);

        $data = $request->except('_token');
        $governorate = Governorate::findOrFail($id);
        if ($governorate->update($data))
            return response()->json(['status' => 200]);
        else
            return response()->json(['status' => 405]);
    }


    public function destroy($id)
    {
        //
    }

    public function delete(Request $request)
    {
        $governorate = Governorate::findOrFail($request->id);
        $governorate->delete();
        return response(['message'=>'تم الحذف بنجاح','status'=>200],200);
    }


}
