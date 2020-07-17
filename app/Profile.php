<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static countDailyProfiles()
 * @method static create(array $profile_data)
 */
class Profile extends Model
{
    protected $fillable = ['user_id', 'city_id', 'profession', 'phone_number'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function scopeCountDailyProfiles($query)
    {
        return $query->whereDate('created_at', Carbon::today())->count();
    }
}
