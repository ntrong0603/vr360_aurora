<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReservationVistModel extends Model
{
    use HasFactory;

    protected $table = 'tb_giu_cho_tham_quan';
    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';

    /**
     * Function get list product
     * @param $where condititon get list product
     * @param colection
     */
    public function gets($where = array())
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
        return $result->orderBy('new', 'desc')->orderBy('id', "desc")->paginate(20);
    }

    public function country()
    {
        return $this->hasOne('App\Models\CountryModel', 'id', 'quoc_gia');
    }

    public function business()
    {
        return $this->hasOne('App\Models\BusinessModel', 'id', 'nganh_nghe');
    }

    public function datChoThue()
    {
        return $this->hasOne('App\Models\ProductModel', 'id', 'dat_cho_thue');
    }

    public function nhaXuongChoThue()
    {
        return $this->hasOne('App\Models\ProductModel', 'id', 'nha_xuong_cho_thue');
    }
}
