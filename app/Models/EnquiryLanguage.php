<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EnquiryLanguage extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'enquiry_id',
        'lang',
        'note',
    ];

    public function enquiry()
    {
        return $this->belongsTo(Enquiry::class);
    }
}
