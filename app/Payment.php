<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = ['payment_method_id', 'user_id', 'course_id', 'lecture_mode', 'amount', 'transaction_code', 'status'];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function commission()
    {
        return $this->hasOne(Payment::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
