<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SceneLanguage extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'scene_id',
        'lang',
        'content',
        'photo',
    ];

    public function scene()
    {
        return $this->belongsTo(Scene::class);
    }
}
