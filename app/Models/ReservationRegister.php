<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReservationRegister extends Model
{
    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'ten_dk',
        'sdt',
        'email',
        'ten_doanh_nghiep',
        'loai',
        'business',
        'country_id',
        'muc_dich_su_dung',
        'muc_dich_su_dung_khac',
        'land_id',
        'land_name',
        'content',
        'new'
    ];
    /**
     * Function get list product
     * @param $where condititon get list product
     * @param colection
     */
    public function getDatas($where = array())
    {
        $result = $this;
        if (!empty($where)) {
            $result = $result->where(function ($query) use ($where) {
                if (isset($where['ten_dk'])) {
                    $query->where('ten_dk', 'like', "%" . $where['ten_dk'] . "%");
                }
                if (isset($where['email'])) {
                    $query->where('email', 'like', "%" . $where['email'] . "%");
                }
                if (isset($where['sdt'])) {
                    $query->where('sdt', 'like', "%" . $where['sdt'] . "%");
                }
                if (isset($where['loai'])) {
                    $query->where('loai', $where['loai']);
                }
            });
        }
        return $result->orderBy('new', 'asc')->orderBy('id', "desc")->paginate(20)->appends($where);
    }
    public function land()
    {
        return $this->belongsTo(Land::class);
    }
    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    // public function business()
    // {
    //     return $this->belongsTo(Business::class);
    // }
    public function landUse()
    {
        return $this->belongsTo(LandUse::class);
    }
}
