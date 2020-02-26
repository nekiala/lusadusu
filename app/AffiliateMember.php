<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AffiliateMember extends Model
{
    protected $fillable = ['affiliate_id', 'member_id'];

    public function affiliate()
    {
        return $this->belongsTo(Affiliate::class);
    }
}
