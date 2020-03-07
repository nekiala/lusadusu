<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    protected $fillable = [
        'course_id', 'user_id',
        'started', 'started_at', 'finished_at', 'normal_finish', 'passed',
        'percentage_obtained', 'percentage_required', 'can_visualize'
    ];

    public function lesson()
    {
        return $this->belongsTo(Lesson::class);
    }
}
