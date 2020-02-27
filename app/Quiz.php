<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    protected $fillable = ['lesson_id', 'question', 'type', 'status'];

    public function lesson()
    {
        return $this->belongsTo(Lesson::class);
    }
}
