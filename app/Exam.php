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

    public function scopeFinished($query, $user_id)
    {
        return $query->where('user_id', $user_id)->whereNotNull('finished_at')->orderBy('id', 'DESC');
    }

    public function scopeUnstarted($query, $user_id)
    {
        return $query->where(['user_id' => $user_id, 'started' => 0])->orderBy('id', 'DESC');
    }

    public function scopeUnfinished($query, $user_id)
    {
        return $query->where('user_id', $user_id)->whereNull('finished_at')->orderBy('id', 'DESC');
    }
}
