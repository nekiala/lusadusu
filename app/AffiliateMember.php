<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AffiliateMember extends Model
{


    public function affiliate()
    {
        return $this->belongsTo(Affiliate::class);
    }
}
