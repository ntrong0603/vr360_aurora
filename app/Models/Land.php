<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use phpDocumentor\Reflection\Types\Boolean;

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

    /**
     * Function get list data land
     *
     * @param array $arrCol list column need get
     * @param \Illuminate\Http\Request $request
     * @param int $limit limit get
     * @param array $arrOrderBy
     * @param Boolean $paginate
     * @return collection
     */
    public function getDatas( $request, $limit = 20, $arrOrderBy = [],  $paginate = true)
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

        if (!empty($arrOrderBy)) {
            foreach ($arrOrderBy as $sort) {
                if (!empty($sort['column']) && !empty($sort['value'])) {
                    $datas = $datas->orderBy($sort['column'], $sort['value']);
                }
            }
        }
        if ($limit == 1) {
            $datas = $datas->first();
        } else {
            if ($paginate) {
                $datas = $datas->paginate($limit)->appends($request);
            } else {
                if ($limit == 0) {
                    $datas = $datas->get();
                } else {
                    $datas = $datas->limit($limit)->get();
                }
            }
        }

        return $datas;
    }
    public function landLanguages()
    {
        return $this->hasMany(LandLanguage::class);
    }
}
