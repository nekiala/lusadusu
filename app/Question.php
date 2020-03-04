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

    public function scopeUserLastQuestions($query, $user_id, $limit)
    {
        return $query->where('user_id', $user_id)->orderBy('id', 'desc')->limit($limit);
    }

    public function scopeQuestionCountByUser($query, $category_id, $user_id)
    {
        return $query->where(['category_id' => $category_id, 'user_id' => $user_id])->orWhere('is_public', 1)->count();
    }
}
