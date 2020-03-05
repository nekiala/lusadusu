<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Commission extends Model
{
    protected $fillable = ['payment_id', 'affiliate_code', 'commission_type', 'amount'];

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }
}
