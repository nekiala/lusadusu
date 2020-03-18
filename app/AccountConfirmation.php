<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AccountConfirmation extends Model
{
    protected $fillable = [
        'phone_number', 'email_address',
        'confirmation_code', 'status'
    ];
}
