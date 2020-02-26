<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $fillable = ['category_id', 'user_id', 'subject', 'description', 'notify', 'status'];

    public function discussions()
    {
        return $this->hasMany(Discussion::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
