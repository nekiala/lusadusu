<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static where(string $string, $user_id)
 * @method static create(array $array)
 */
class AffiliateMember extends Model
{
    protected $fillable = ['affiliate_id', 'member_id'];

    public function affiliate()
    {
        return $this->belongsTo(Affiliate::class);
    }
}
