<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Traits\WebpTrait;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class NationalityController extends Controller
{
    use WebpTrait;

    public function __construct()
    {
        $this->middleware('permission:عرض الدول')->only('index');
        $this->middleware('permission:اضافة الدول')->only('create','store');
        $this->middleware('permission:تعديل الدول')->only('edit','update');
        $this->middleware('permission:حذف الدول')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
            $data = Country::orderBy('id','DESC')->get();
            return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    $checkEdit = (auth()->guard('admin')->user()->can('تعديل التصنيفات')) ? 'display:inline-block' : 'display:none';
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف التصنيفات')) ? 'display:inline-block' : 'display:none';
                    return '
                            <button style="'.$checkEdit.'" type="button" data-id="' . $data->id . '" class="btn btn-pill btn-info-light editBtn"><i class="fa fa-edit"></i></button>
                            <button style="'.$checkDelete.'" class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $data->id . '" data-title="' . $data->title_ar . '">
                                    <i class="fas fa-trash"></i>
                            </button>
                       ';
                })
                ->addColumn('governorates', function ($data) {
                    $link = route('governoratesOfCountry',$data->id);
                    return '<a class="btn btn-pill btn-success" href="'.$link.'">معاينة <i class="fa fa-map text-white"></i> </a>';
                })
                ->editColumn('image', function ($data) {
                    return '
                    <img alt="Slider" onclick="window.open(this.src)" style="cursor:pointer" class="avatar-lg bradius" src="'.$data->image.'">
                    ';
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/country/index');
        }
    }


    public function create()
    {
        return view('Admin/country.parts.create');
    }



    public function store(request $request): \Illuminate\Http\JsonResponse
    {
        $request->validate([
            'title_ar'   => 'required|max:255|unique:countries,title_ar',
            'image'      => 'required|max:255|image',
        ],[
            'title_ar.unique'     => 'اسم الدولة تم ادخاله مسبقا',
            'image.required'      => 'يرجي رفع صورة لعلم الدولة',
            'title_ar.required'   => 'يرجي ادخال اسم الدولة',
        ]);
        $data = $request->except('_token','image');
        $data['image'] = $this->saveImage($request->image,'assets/uploads/country');
        if(Country::create($data))
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
        $row = Country::find($id);
        return view('Admin/country.parts.edit',compact('row'));
    }



    public function update(Request $request,$id)
    {
        $request->validate([
            'title_ar'   => 'required|max:255|unique:countries,title_ar,'.$id,
            'image'      => 'nullable|max:255|image',
        ],[
            'title_ar.unique'     => 'اسم الدولة تم ادخاله مسبقا',
            'title_ar.required'   => 'يرجي ادخال اسم الدولة',
        ]);

        $data = $request->except('_token','image');

        if($request->has('image') && $request->image != null)
            $data['image'] = $this->saveImage($request->image,'assets/uploads/country');

        $country = Country::findOrFail($id);
        if ($country->update($data))
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
        $row = Country::findOrFail($request->id);
        $row->delete();
        return response(['message'=>'تم الحذف بنجاح','status'=>200],200);
    }
}
