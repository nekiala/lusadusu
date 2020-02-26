<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Gender extends Model
{
    protected $fillable = ['code', 'name'];

    public function users()
    {
        return $this->hasMany(User::class);
    }
}
