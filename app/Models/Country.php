<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory;
    protected $guarded=[];
    public $timestamps = false;


    ##  Mutators and Accessors
    public function getImageAttribute()
    {
        return get_file($this->attributes['image']);
    }

    public function governorate(){
        return $this->hasMany(Governorate::class,'country_id');
    }

    public function users(){
        return $this->hasMany(User::class,'country_id');
    }
    public function providers(){
        return $this->hasMany(Provider::class,'country_id');
    }
}
