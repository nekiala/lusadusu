<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static find($city_id)
 */
class City extends Model
{
    protected $fillable = ['name', 'status'];

    public function profiles()
    {
        return $this->hasMany(Profile::class);
    }
}
