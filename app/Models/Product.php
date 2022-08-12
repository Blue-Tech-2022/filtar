<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $guarded=[];


    ##  Mutators and Accessors
//    public function getImagesAttribute()
//    {
//        return get_file($this->attributes['images']);
//    }
    public function getMainImageAttribute()
    {
        return get_file($this->attributes['main_image']);
    }



    ## Relations
    public function category(){
        return $this->belongsTo(Category::class,'category_id');
    }

    public function provider(){
        return $this->belongsTo(Provider::class,'provider_id');
    }

    public function images(){
        return $this->hasMany(ProductImages::class,'product_id');
    }



}//end class
