<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    protected $fillable = [
        'course_id', 'title', 'description',
        'link', 'status'
    ];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }
}
