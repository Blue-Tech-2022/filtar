<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function getLogoAttribute()
    {
        return get_client_file($this->attributes['logo']);
    }

}//end class
