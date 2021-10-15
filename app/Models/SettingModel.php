<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SettingModel extends Model
{
    use HasFactory;

    protected $table = 'setting';
    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    public function createdOrUpdate($where, $data)
    {
        return $this->updateOrCreate($where, $data);
    }
}
