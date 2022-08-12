<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProduct;
use App\Models\Category;
use App\Models\CategorySubCategories;
use App\Models\Product;
use App\Models\ProductImages;
use App\Traits\WebpTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;
use Yoeunes\Toastr\Toastr;

class ProductController extends Controller
{
    use WebpTrait;

    public function __construct()
    {
        $this->middleware('permission:عرض المنتجات')->only('index');
        $this->middleware('permission:تعديل المنتجات')->only('showProductImages','productActivation');
        $this->middleware('permission:حذف المنتجات')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
            $products = Product::latest()->get();
            return Datatables::of($products)
                ->addColumn('action', function ($products) {
                    return '
                            <button class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $products->id . '" data-title="' . $products->title . '">
                                    <i class="fas fa-trash"></i>
                            </button>
                       ';
                })
                ->editColumn('main_image', function ($products) {
                    return '
                    <img alt="image" onclick="window.open(this.src)" class="avatar-md rounded-circle" src="'.$products->main_image.'">
                    ';
                })
                ->editColumn('category_id', function ($products) {
                    return ($products->category->title) ?? '--';
                })
                ->editColumn('provider_id', function ($products) {
                    if($products->provider)
                        $name = ($products->provider->first_name).' '.($products->provider->last_name);
                    else
                        $name = '<span class="text-danger">تم حذفه</span>';

                    return $name;
                })
                ->editColumn('status', function ($products) {
                    if($products->status == 0)
                        $span = '<span style="cursor: pointer" data-id="'.$products->id.'" class="badge badge-danger statusSpan">غير مفعل</span';
                    else
                        $span = '<span style="cursor: pointer" data-id="'.$products->id.'"  class="badge badge-success statusSpan">مفعل</span';

                    return $span;
                })
                ->addColumn('images', function ($products) {
                    $url = route('showProductImages',$products->id);
                    return "<a class='btn btn-primary' href = '".$url."'>عرض <i class='fa fa-images'></i> </a>";
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/product/index');
        }
    }

    public function showProductImages($product_id){
        $images = ProductImages::where('product_id',$product_id)->latest()->get();
        $product= Product::findOrFail($product_id);
        return view('Admin/product/images',compact('images','product'));
    }

    public function deleteProductImage(request $request){
        $image = ProductImages::find($request->id);
        if (file_exists($image->getAttributes()['image'])) {
            unlink($image->getAttributes()['image']);
        }
        $image->delete();
        return response([
            'id'      =>$request->id,
            'message' =>'تم الحذف بنجاح',
            'status'  =>200
        ],200);
    }


    public function delete(Request $request)
    {
        $product = Product::findOrFail($request->id);
        $images  = ProductImages::where('product_id',$request->id)->get();

        if (file_exists($product->getAttributes()['main_image']))
            unlink($product->getAttributes()['main_image']);

        foreach ($images as $image){
            if (file_exists($image->getAttributes()['image'])) {
                unlink($image->getAttributes()['image']);
            }
        }
        $product->delete();
        return response(['message'=>'تم الحذف بنجاح','status'=>200],200);
    }

    public function productActivation(Request $request)
    {
        $product = Product::find($request->id);

        ($product->status == '0') ? $product->status = '1' : $product->status = '0';
        $product->save();
        if($product->status == '0'){
            fireBase(null, $product->provider_id, 'تم حظر المنتج الخاص بك', '500', null, null);
        }
        else{
            fireBase(null, $product->provider_id, 'تم الموافقة علي المنتج وهو الان متاح في المتجر', '500', null, null);
        }

        return response()->json(
            [
                'success' => true,
                'message' => 'تم تغيير حالة المنتج بنجاح'
            ]);
    }
}
