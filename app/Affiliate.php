<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Affiliate extends Model
{
    protected $fillable = [
        'affiliate_parameter_id',
        'user_id',
        'status',
        'comments'
    ];
}
