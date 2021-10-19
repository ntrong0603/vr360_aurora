<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LandStyleLanguage extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'land_style_id',
        'lang',
        'note',
    ];

    public function landStyle()
    {
        return $this->belongsTo(LandStyle::class);
    }
}
