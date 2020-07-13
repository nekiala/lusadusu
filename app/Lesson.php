<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static paginate()
 * @method static randLesson($course_id)
 * @method static lessonName($lesson_id)
 */
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

    public function getExamCountAttribute()
    {
        return $this->hasMany(Exam::class)->count();
    }

    public function quizzes()
    {
        return $this->hasMany(Quiz::class);
    }

    public function scopeRandLesson($query, $course_id)
    {
        return $query->where([
            'status' => 1,
            'course_id' => $course_id
        ])->inRandomOrder()->first();
    }

    public function scopeLessonName($query, $id) {

        return $query->select('title')->where('id', $id)->first()->title;
    }
}
