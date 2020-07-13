<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static find(int $mode_id)
 */
class Mode extends Model
{
    protected $fillable = ['name', 'winning_average', 'amount_to_pay', 'max_retries', 'status'];
}
