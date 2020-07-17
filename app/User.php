<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;
use Laravel\Passport\HasApiTokens;

/**
 * @method static create(array $user_data)
 * @method static withProfile()
 * @method static withoutProfile()
 */
class User extends Authenticatable
{
    use Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'gender_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function profile()
    {
        return $this->hasOne(Profile::class);
    }

    public function affiliate()
    {
        return $this->hasOne(Affiliate::class);
    }

    public function gender()
    {
        return $this->belongsTo(Gender::class);
    }

    public function generateToken()
    {
        $this->api_token = Str::random(60);
        $this->save();

        return $this->api_token;
    }

    public function discussions()
    {
        return $this->hasMany(Discussion::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    public function exams()
    {
        return $this->hasMany(Exam::class);
    }

    public function scopeWithProfile($query)
    {
        return $query->whereIn('id', function ($result) {
            $result->select('user_id')
                ->from(with(new Profile)->getTable());
        })->get();
    }

    public function scopeWithoutProfile($query)
    {
        return $query->whereNotIn('id', function ($result) {
            $result->select('user_id')
                ->from(with(new Profile)->getTable());
        })->get();
    }
}
