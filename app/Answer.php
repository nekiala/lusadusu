<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Answer extends Model
{
    protected $fillable = ['quiz_id', 'exam_id', 'assertion_id', 'correct_answer'];

}
