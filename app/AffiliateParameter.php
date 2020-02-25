<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AffiliateParameter extends Model
{
    protected $fillable = [
        'participation_number',
        'victory_number',
        'expiration_delay_in_days',
        'status'
    ];
}
