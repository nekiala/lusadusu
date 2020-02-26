<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    protected $fillable = ['name', 'status'];

    public function profiles()
    {
        return $this->hasMany(Profile::class);
    }
}
