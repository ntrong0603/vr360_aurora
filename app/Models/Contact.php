<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'profection',
        'email',
        'phone',
        'note',
        'status'
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
                if (isset($where['name'])) {
                    $query->where('name', 'like', "%" . $where['name'] . "%");
                }
                if (isset($where['profection'])) {
                    $query->where('profection', 'like', "%" . $where['profection'] . "%");
                }
                if (isset($where['email'])) {
                    $query->where('email', 'like', "%" . $where['email'] . "%");
                }
                if (isset($where['phone'])) {
                    $query->where('phone', 'like', "%" . $where['phone'] . "%");
                }
            });
        }
        return $result->orderBy('status', 'asc')->orderBy('id', "desc")->paginate(20)->appends($where);
    }
}
