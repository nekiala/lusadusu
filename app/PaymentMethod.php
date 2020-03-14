<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static where(string $string, string $endpoint)
 */
class PaymentMethod extends Model
{
    protected $fillable = ['prefix', 'name', 'status'];

    public function scopeStatus($query, $status)
    {
        return $query->where('status', $status);
    }
}
