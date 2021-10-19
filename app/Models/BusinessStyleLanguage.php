<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessStyleLanguage extends Model
{
    use HasFactory;

     /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'business_style_id',
        'lang'
    ];

    public function businessStyle()
    {
        return $this->belongsTo(BusinessStyle::class);
    }
}
