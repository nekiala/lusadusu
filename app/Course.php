<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * @method static create(array $all)
 */
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

    public function getLessonCountAttribute()
    {
        return $this->hasMany(Lesson::class)->whereCourseId($this->id)->count();
    }

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    /**
     * courses that the user has not passed exams
     * @param $material_id
     * @param $user_id
     * @return \Illuminate\Database\Query\Builder
     */
    public static function userCourses($material_id, $user_id)
    {
        return DB::table('courses as c')
            ->where([
                'c.status' => 1,
                'c.material_id' => $material_id
            ])
            ->whereNotIn('id', DB::table('exams')
                ->where([
                    'user_id' => $user_id,
                    'started' => 1
                ])->pluck('course_id')
            );
    }
}
