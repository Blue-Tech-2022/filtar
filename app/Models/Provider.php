<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    use HasFactory;
    protected $guarded = [];


    public function country()
    {
        return $this->belongsTo(Country::class,'country_id');
    }

    public function governorate()
    {
        return $this->belongsTo(Governorate::class,'governorate_id');
    }

    public function getLogoAttribute()
    {
        return get_client_file($this->attributes['logo']);
    }

    public function getNationalityIdImageAttribute()
    {
        return get_client_file($this->attributes['nationality_id_image']);
    }

    public function getVatNumberImageAttribute()
    {
        return get_client_file($this->attributes['vat_number_image']);
    }

    public function getCommercialNumberImageAttribute()
    {
        return get_client_file($this->attributes['commercial_number_image']);
    }

    public function products(){
        return $this->hasMany(Product::class,'provider_id');
    }
}
