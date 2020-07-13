<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * @method static formattedAnswersByExam($id)
 */
class Answer extends Model
{
    protected $fillable = ['quiz_id', 'exam_id', 'assertion_id', 'correct_answer'];


    public function exam()
    {
        return $this->belongsTo(Exam::class);
    }

    /**
     * This method return array in which each line represents to a
     * quiz and its corresponding assertion for a given exam id
     * @param $query
     * @param $exam_id
     * @return mixed
     */
    public function scopeFormattedAnswersByExam($query, $exam_id)
    {
        return $query
            ->join('quizzes', function ($query) {
            $query->on('answers.quiz_id', '=', 'quizzes.id');
        })->join('assertions', function ($query) {
            $query->on('answers.assertion_id', '=', 'assertions.id');
        })->select('quizzes.question', 'assertions.answer', 'answers.correct_answer')
            ->where('answers.exam_id', $exam_id)->get();
    }
}
