<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImages;
use App\Models\Slider;
use App\Traits\GeneralTrait;
use App\Traits\PhotoTrait;
use App\Traits\WebpTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    use GeneralTrait,WebpTrait;
    public function allCategories(){
        $data = Category::all();
        return $this->returnData('data',$data,'get data successfully');
    }

    public function latestProducts(){
        $products = Product::select('id','provider_id','main_image','title','price')
            ->where('status','1')
            ->whereHas('provider', function ($q) {
                $q->where('status', '1');
            })
            ->with(['provider' => function($query){
                $query->select('id','logo','store_name');
            }])->latest()->take(5);
        return $this->returnData('data',$products->get(),'get data successfully');
    }


    public function products(request $request){
        $validator = Validator::make($request->all(), [
            'category_id' => 'nullable|exists:categories,id',
            'provider_id' => 'nullable|exists:providers,id',
            'search_word' => 'nullable',
            'min_price'   => 'nullable|numeric',
            'max_price'   => 'nullable|numeric',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $products = Product::query()
            ->select('id','provider_id','main_image','title','price')
            ->where('status','1')
            ->whereHas('provider', function ($q) {
                $q->where('status', '1');
            })
            ->with(['provider' => function($query){
            $query->select('id','logo','store_name');
        }]);

        if($request->category_id != null)
            $products->where('category_id',$request->category_id);


        if($request->provider_id != null)
            $products->where('provider_id',$request->provider_id);

        if($request->search_word != null)
            $products->where('title', 'like', '%' . $request->search_word . '%')->get();

        if($request->min_price != null)
            $products->where('price','>=',$request->min_price);

        if($request->max_price != null)
            $products->where('price','<=',$request->max_price);

        return $this->returnData('data',$products->get(),'get data successfully');

    }

    public function productDetails(request $request){
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $product = Product::with(['images','provider' => function($query){
            $query->select('id','logo','store_name');
        }])->find($request->product_id);

        return $this->returnData('data',$product,'get success');

    }

    public function sliders(){
        $data = Slider::all();
        return $this->returnData('data',$data,'get success');
    }

    public function addProduct(request $request){
        $validator = Validator::make($request->all(), [
            'provider_id'                    => 'required|exists:providers,id',
            'main_image'                     => 'required|image',
            'title'                          => 'required|max:255',
            'price'                          => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'category_id'                    => 'required|exists:categories,id',
            'details'                        => 'required',
            'images'                         => 'required|array',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $data = $request->except('main_image','images');

        if($request->has('main_image') && $request->main_image != null)
            $data['main_image'] = $this->saveImage($request->main_image,'assets/uploads/products','image',100);

        $product = Product::create($data);

        foreach ($request->images as $row){
            $row = $this->saveImage($row,'assets/uploads/products','image',100);
            ProductImages::create([
                'image'      => $row,
                'product_id' => $product->id
            ]);
        }

        return $this->returnSuccessMessage('تم تقديم المنتج وفي انتظار المواققة');

    }

    public function deleteProduct(request $request){
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);
        Product::find($request->product_id)->delete();
        return $this->returnSuccessMessage('تم حذف المنتج بنجاح');
    }

    public function editProduct(request $request){
        $validator = Validator::make($request->all(), [
            'product_id'                     => 'required|exists:products,id',
            'main_image'                     => 'nullable|image',
            'title'                          => 'nullable|max:255',
            'price'                          => 'nullable|regex:/^\d+(\.\d{1,2})?$/',
            'category_id'                    => 'nullable|exists:categories,id',
            'details'                        => 'nullable',
            'images'                         => 'nullable|array',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(),400);

        $data = $request->except('product_id','main_image','images');

        if($request->has('main_image') && $request->main_image != null)
            $data['main_image'] = $this->saveImage($request->main_image,'assets/uploads/products','image',100);

        $product = Product::find($request->product_id);

        $data['status'] = '0';

        $product->update($data);

        if($request->has('images') && $request->images != null){
            $product->images()->delete();


            foreach ($request->images as $row){
                $row = $this->saveImage($row,'assets/uploads/products','image',100);
                ProductImages::create([
                    'image'      => $row,
                    'product_id' => $product->id
                ]);
            }
        }


        return $this->returnSuccessMessage('تم تعديل المنتج وفي انتظار المواققة');

    }




}
