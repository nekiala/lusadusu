<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Discussion extends Model
{
    protected $fillable = [
        'category_id', 'user_id', 'subject', 'description', 'notify', 'status'
    ];

    public function question()
    {
        return $this->belongsTo(Question::class);
    }
}
