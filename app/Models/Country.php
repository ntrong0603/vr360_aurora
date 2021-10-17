<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'code',
        'name',
        'status'
    ];
    public function getDatas($request)
    {
        $datas = $this;

        if (!empty($request['name'])) {
            $datas = $datas->where('name', 'like', "%{$request['name']}%");
        }
        return $datas->orderBy('id', 'DESC')->paginate(20)->appends($request);
    }
    public function countryLanguages()
    {
        return $this->hasMany(CountryLanguage::class);
    }
}
