<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mode extends Model
{
    protected $fillable = ['name', 'winning_average', 'status'];
}
