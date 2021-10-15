<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CountryModel extends Model
{
    use HasFactory;

    protected $table = 'country';
    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';
}
