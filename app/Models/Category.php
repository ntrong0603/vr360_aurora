<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'link',
        'style_event',
        'name_scene',
        'name_hotspot',
        'category_id',
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
                if (isset($where['category_id'])) {
                    $query->where('category_id', $where['category_id']);
                }
            });
        }
        return $result->orderBy('status', 'asc')->orderBy('id', "desc")->paginate(20)->appends($where);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function categories()
    {
        return $this->hasMany(Category::class);
    }


    public function categoryLanguages()
    {
        return $this->hasMany(CategoryLanguage::class);
    }
}
