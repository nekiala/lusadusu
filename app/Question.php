<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static userLastQuestions($user_id, $limit)
 * @method static paginate()
 * @method static paginateByOrderDesc()
 * @method static paginateWithByStatusAndByOrderDesc(int $int)
 */
class Question extends Model
{
    protected $fillable = ['category_id', 'user_id', 'subject', 'description', 'notify', 'status', 'is_public'];

    public function discussions()
    {
        return $this->hasMany(Discussion::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeUserLastQuestions($query, $user_id, $limit)
    {
        return $query->where('user_id', $user_id)->orderBy('id', 'desc')->limit($limit);
    }

    public function scopeQuestionCountByUser($query, $category_id, $user_id)
    {
        return $query->where(['category_id' => $category_id, 'user_id' => $user_id])->orWhere([
            'is_public' => 1,
            'category_id' => $category_id
        ])->count();
    }

    public function scopePaginateByOrderDesc($query)
    {
        return $query->orderBy('id', 'desc')->paginate();
    }
}
