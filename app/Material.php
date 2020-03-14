<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Material extends Model
{
    protected $fillable = ['name', 'description', 'status'];

    public static function stats($id)
    {
        $stats = DB::select("SELECT m.id, m.name,
(
SELECT COUNT(e.id) FROM exams e JOIN
courses c ON (e.course_id = c.id) WHERE (e.user_id = ?) AND (c.material_id = m.id)) AS courses
FROM materials m WHERE (status = 1)", [$id]);

        return $stats;
    }

    public function courses()
    {
        return $this->hasMany(Course::class);
    }

    public function scopeStatus($query, $status)
    {
        return $query->where('status', $status);
    }
}
