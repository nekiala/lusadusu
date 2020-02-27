<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Assertion extends Model
{
    protected $fillable = ['quiz_id', 'answer', 'correct_answer', 'status'];

    public function quiz()
    {
        return $this->belongsTo(Quiz::class);
    }
}
