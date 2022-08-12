<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Product;
use App\Traits\PhotoTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Yajra\DataTables\DataTables;

class AdminController extends Controller
{
    use PhotoTrait;
    public function __construct()
    {
        $this->middleware('permission:عرض المشرفين')->only('index');
        $this->middleware('permission:اضافة مشرف')->only('create','store');
        $this->middleware('permission:تعديل المشرفين')->only('edit','update');
        $this->middleware('permission:حذف المشرفين')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
            $admins = Admin::latest()->get();
            return Datatables::of($admins)
                ->addColumn('action', function ($admins) {
                    $checkEdit = (auth()->guard('admin')->user()->can('تعديل المشرفين')) ? 'display:inline-block' : 'display:none';
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف المشرفين')) ? 'display:inline-block' : 'display:none';
                    return '
                            <button type="button" style="'.$checkEdit.'" data-id="' . $admins->id . '" class="btn btn-pill btn-info-light editBtn"><i class="fa fa-edit"></i></button>
                            <button style="'.$checkDelete.'"  class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $admins->id . '" data-title="' . $admins->name . '">
                                    <i class="fas fa-trash"></i>
                            </button>
                       ';
                })
                ->addColumn('role', function ($admins) {
                    $value = [];
                    foreach ($admins->roles as $role){
                        $value[] .= "<span class='badge badge-success'>$role->name</span>";
                    }
                    return $value;
                })
                ->editColumn('created_at', function ($admins) {
                    return $admins->created_at->diffForHumans();
                })
                ->editColumn('image', function ($admins) {
                    return '
                    <img alt="image" onclick="window.open(this.src)" class="avatar avatar-md rounded-circle" src="'.get_user_file($admins->image).'">
                    ';
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/admin/index');
        }
    }


    public function delete(Request $request)
    {
        $admin = Admin::where('id', $request->id)->first();
        if ($admin == auth()->guard('admin')->user()) {
            return response(['message'=>"لا يمكن حذف المشرف المسجل به !",'status'=>501],200);
        } else {
            if (file_exists($admin->image)) {
                unlink($admin->image);
            }
            $admin->delete();
            return response(['message'=>'تم الحذف بنجاح','status'=>200],200);
        }
    }

    public function myProfile()
    {
        $admin = auth()->guard('admin')->user();
        return view('Admin/admin/profile',compact('admin'));
    }//end fun



    public function create(){
        $roles = Role::all();
        return view('Admin/admin.parts.create',compact('roles'));
    }

    public function store(request $request): \Illuminate\Http\JsonResponse
    {
            $inputs = $request->validate([
                'email'     => 'required|unique:admins',
                'name'      => 'required',
                'password'  => 'required|min:6',
                'roles'     => 'required',
                'image'     => 'nullable|mimes:jpeg,jpg,png,gif',
            ]);
            if($request->has('image')){
                $file_name = $this->saveImage($request->image,'assets/uploads/admins');
                $inputs['image'] = 'assets/uploads/admins/'.$file_name;
            }
        unset($inputs['roles']);
        $inputs['password'] = Hash::make($request->password);
        $admin = Admin::create($inputs);
        if ($admin->assignRole($request->roles))
                return response()->json(['status'=>200]);
            else
                return response()->json(['status'=>405]);
    }

    public function edit(Admin $admin){
        $roles = Role::all();
        $rolePermissions = DB::table("model_has_roles")->where("model_id",$admin->id)
            ->pluck('model_has_roles.role_id')
            ->all();
        return view('Admin/admin.parts.edit',compact('admin','roles','rolePermissions'));
    }

    public function update(request $request,$id)
    {
        $inputs = $request->validate([
            'email'    => 'required|unique:admins,email,'.$id,
            'name'     => 'required',
            'image'    => 'nullable',
            'roles'     => 'required',
            'password' => 'nullable|min:6',
        ]);
        if ($request->has('image')) {
            $file_name = $this->saveImage($request->image, 'assets/uploads/admins');
            $inputs['image'] = 'assets/uploads/admins/' . $file_name;
        }
        if ($request->has('password') && $request->password != null)
            $inputs['password'] = Hash::make($request->password);
        else
            unset($inputs['password']);

        unset($inputs['roles']);

        $admin = Admin::findOrFail($id);
        DB::table('model_has_roles')->where('model_id',$admin->id)->delete();
        $admin->assignRole($request->roles);
        if ($admin->update($inputs))
            return response()->json(['status' => 200]);
        else
            return response()->json(['status' => 405]);
    }
}//end class
