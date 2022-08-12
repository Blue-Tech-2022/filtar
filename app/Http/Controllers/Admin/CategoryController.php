<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Traits\PhotoTrait;
use App\Traits\WebpTrait;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class CategoryController extends Controller
{
    use WebpTrait;
    public function __construct()
    {
        $this->middleware('permission:عرض التصنيفات')->only('index');
        $this->middleware('permission:اضافة تصنيفات')->only('create','store');
        $this->middleware('permission:تعديل التصنيفات')->only('edit','update');
        $this->middleware('permission:حذف التصنيفات')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
            $categories = Category::latest()->get();
            return Datatables::of($categories)
                ->addColumn('action', function ($categories) {
                    $checkEdit = (auth()->guard('admin')->user()->can('تعديل التصنيفات')) ? 'display:inline-block' : 'display:none';
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف التصنيفات')) ? 'display:inline-block' : 'display:none';
                    return '
                            <button type="button" style="'.$checkEdit.'" data-id="' . $categories->id . '" class="btn btn-pill btn-info-light editBtn"><i class="fa fa-edit"></i></button>
                            <button  style="'.$checkDelete.'"  class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $categories->id . '" data-title="' . $categories->title . '">
                                    <i class="fas fa-trash"></i>
                            </button>
                       ';
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/category/index');
        }
    }


    public function create()
    {
        return view('Admin/category.parts.create');
    }



    public function store(request $request): \Illuminate\Http\JsonResponse
    {
        $inputs = $request->validate([
            'title'   => 'required|max:255|unique:categories,title',
        ],[
            'title.unique'     => 'اسم القسم مستخدم من قبل',
        ]);
        if(Category::create($inputs))
            return response()->json(['status'=>200]);
        else
            return response()->json(['status'=>405]);
    }


    public function show($id)
    {
        //
    }


    public function edit(Category $category)
    {
        return view('Admin/category.parts.edit',compact('category'));
    }



    public function update(Request $request,$id)
    {
        $inputs = $request->validate([
            'title'      => 'required|max:255|unique:categories,title,'.$id,
        ],[
            'title.unique'     => 'اسم القسم مستخدم من قبل',
        ]);

        $category = Category::findOrFail($id);

        if ($category->update($inputs))
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
        $category = Category::findOrFail($request->id);
        $category->delete();
        return response(['message'=>'تم الحذف بنجاح','status'=>200],200);
    }
}
