<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LandUseLanguage extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'land_use_id',
        'lang',
        'note',
    ];

    public function landUse()
    {
        return $this->belongsTo(LandUse::class);
    }
}
