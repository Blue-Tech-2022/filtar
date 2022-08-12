<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExplanationTag extends Model
{
    use HasFactory;
    protected $guarded = [];


    public function explanation(){
        return $this->belongsTo(Explanation::class,'explanation_id');
    }
}
