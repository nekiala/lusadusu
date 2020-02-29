<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    protected $fillable = ['prefix', 'name', 'status'];

    public function scopeStatus($query, $status)
    {
        return $query->where('status', $status);
    }
}
