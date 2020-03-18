<?php

namespace App\Mail;

use App\Profile;
use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ConfirmationCode extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $code;

    /**
     * Create a new message instance.
     *
     * @param User $user
     * @param string $code
     */
    public function __construct(User $user, string $code)
    {
        $this->code = $code;
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this
            ->subject("Your confirmation code")
            ->view('emails.account-confirmation')->with([
                'user' => $this->user,
                'code' => $this->code
            ]);
    }
}
