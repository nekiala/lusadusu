<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['name', 'status'];

    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    public function scopeStatus($query, $status)
    {
        return $query->where('status', $status);
    }
}
