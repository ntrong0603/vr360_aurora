<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessModel extends Model
{
    use HasFactory;

    protected $table = 'business_services';
    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';
}
