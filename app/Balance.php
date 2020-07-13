<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static where(string $string, $id)
 */
class Balance extends Model
{
    protected $fillable = ['user_id', 'participation_commission', 'victory_commission'];
}
