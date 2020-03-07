<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Material extends Model
{
    protected $fillable = ['name', 'description', 'status'];

    public function courses()
    {
        return $this->hasMany(Course::class);
    }

    public function scopeStatus($query, $status)
    {
        return $query->where('status', $status);
    }
}
