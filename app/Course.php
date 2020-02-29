<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $fillable = [
        'material_id', 'title', 'description',
        'mode', 'status'
    ];

    public function material()
    {
        return $this->belongsTo(Material::class);
    }

    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }
}
