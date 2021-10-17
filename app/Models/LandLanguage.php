<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LandLanguage extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'land_id',
        'name',
        'content',
        'lang'
    ];

    public function land()
    {
        return $this->belongsTo(Land::class);
    }
}
