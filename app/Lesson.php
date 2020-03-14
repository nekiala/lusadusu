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

    public function exams()
    {
        return $this->hasMany(Exam::class);
    }

    public function quizzes()
    {
        return $this->hasMany(Quiz::class);
    }

    public function scopeRandLesson($query, $course_id)
    {
        return $query->where('status', 1)->where('course_id', $course_id)->inRandomOrder()->first();
    }

    public function scopeLessonName($query, $id) {

        return $query->select('title')->where('id', $id)->first()->title;
    }
}
