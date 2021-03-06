<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * @method static paginate()
 * @method static notAsked($id, int $lesson_id)
 * @method static alreadyAsked(int $id)
 * @method static getActiveCountByLesson(int $lesson_id, int $int)
 */
class Quiz extends Model
{
    protected $fillable = ['lesson_id', 'question', 'type', 'status'];

    public function lesson()
    {
        return $this->belongsTo(Lesson::class);
    }

    public function assertions()
    {
        return $this->hasMany(Assertion::class);
    }

    public function scopeNotAsked($query, $exam_id, $lesson_id)
    {
        return $query->where(['status' => 1, 'lesson_id' => $lesson_id])
            ->whereNotIn('id', DB::table('answers')->where('exam_id', $exam_id)->pluck('quiz_id'));
    }

    public function scopeAlreadyAsked($query, $exam_id)
    {
        return $query->where('status', 1)
            ->whereIn('id', DB::table('answers')->where('exam_id', $exam_id)->pluck('quiz_id'));
    }

    public function scopeGetActiveCountByLesson($query, $lesson_id)
    {
        return $query->where(['lesson_id' => $lesson_id, 'status' => 1])->count();
    }
}
