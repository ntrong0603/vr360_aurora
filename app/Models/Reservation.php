<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
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
        'business_id',
        'country_id',
        'muc_dich_su_dung',
        'muc_dich_su_dung_khac',
        'dat_cho_thue',
        'nha_xuong_cho_thue',
        'muc_dich_tham_quan',
        'muc_dich_tham_quan_khac',
        'so_nguoi_tham_quan',
        'tham_quan_tu_ngay',
        'tham_quan_den_ngay',
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

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function business()
    {
        return $this->belongsTo(Business::class);
    }

    public function datChoThue()
    {
        return $this->belongsTo(Product::class, 'dat_cho_thue', 'id');
    }

    public function nhaXuongChoThue()
    {
        return $this->belongsTo(Product::class, 'nha_xuong_cho_thue', 'id');
    }

    public function visiting()
    {
        return $this->belongsTo(Visiting::class);
    }
}
