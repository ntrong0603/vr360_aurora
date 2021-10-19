<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Enquiry extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'status'
    ];

    public function getDatas($request)
    {
        $datas = $this;
        if (isset($request['name'])) {
            $datas = $datas->where('name', 'like', "%{$request['name']}%");
        }
        return $datas->orderBy('id', 'DESC')->paginate(20)->appends($request);
    }
    public function enquiryLanguages()
    {
        return $this->hasMany(EnquiryLanguage::class);
    }
}
