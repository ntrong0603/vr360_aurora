<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessService extends Model
{
    use HasFactory;

    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';
}
