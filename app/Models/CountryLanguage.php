<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CountryLanguage extends Model
{
    use HasFactory;

    protected $table = 'country_languages';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'country_id',
        'lang'
    ];
    public function country()
    {
        return $this->belongsTo(Country::class);
    }
}
