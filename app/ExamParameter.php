<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static getDurationFromActiveParameter(int $int)
 */
class ExamParameter extends Model
{
    protected $fillable = ['duration', 'status'];

    public function scopeGetDurationFromActiveParameter($query, bool $status)
    {
        return $query->where('status', $status)->first()->duration;
    }
}
