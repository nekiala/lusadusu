<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static paginage()
 * @method static paginate()
 * @method static today()
 * @method static getCountByUser($user_id)
 * @method static getCountByUserAndPassStatus($user_id, int $int)
 * @method static finished($user_id)
 * @method static unfinished($user_id)
 * @method static unstarted($user_id)
 * @method static create(array $all)
 * @method static find(int $exam_id)
 * @property int user_id
 * @property int course_id
 * @property int lesson_id
 * @property float percentage_required
 * @property bool started
 * @property int id
 * @property string started_at
 * @property string duration
 * @property string finished_at
 * @property bool normal_finish
 * @property float percentage_obtained
 * @property bool passed
 */
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

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    public function scopeFinished($query, $user_id)
    {
        return $query->where('user_id', $user_id)->whereNotNull('finished_at')->orderBy('id', 'DESC');
    }

    public function scopeUnstarted($query, $user_id)
    {
        return $query->where(['user_id' => $user_id, 'started' => 0])->orderBy('id', 'DESC');
    }

    public function scopeToday($query)
    {
        return $query->where(['created_at' => Carbon::today()])->orderBy('id', 'DESC');
    }

    public function scopeUnfinished($query, $user_id)
    {
        return $query->where('user_id', $user_id)->whereNull('finished_at')->orderBy('id', 'DESC');
    }

    /**
     * This method return exam count from a given user id
     * @param $query
     * @param $user_id
     * @return int
     */
    public function scopeGetCountByUser($query, $user_id)
    {
        return $query->where('user_id', $user_id)->count();
    }

    public function scopeGetCountByUserAndPassStatus($query, $user_id, bool $passed)
    {
        return $query->where([
            'user_id' => $user_id,
            'passed' => $passed
        ])->count();
    }
}
