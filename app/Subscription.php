<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static countDailySubscriptions()
 */
class Subscription extends Model
{
    public function scopeCountDailySubscriptions($query)
    {
        return $query->whereDate('created_at', Carbon::today())->count();
    }
}
