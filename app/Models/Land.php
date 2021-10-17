<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Land extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'name_hotspot',
        'status',
        'style',
        'view',
    ];

    public function getDatas($request)
    {
        $datas = $this;

        if (!empty($request['name'])) {
            $datas = $datas->where('name', 'like', "%{$request['name']}%");
        }
        if (!empty($request['style'])) {
            $datas = $datas->where('style', $request['style']);
        }
        if (!empty($request['status'])) {
            $datas = $datas->where('status', $request['status']);
        }
        return $datas->orderBy('id', 'DESC')->paginate(20)->appends($request);
    }
    public function landLanguages()
    {
        return $this->hasMany(LandLanguage::class);
    }
}
