<?php

namespace App\Mail;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class NewCommissionCollected extends Mailable
{
    use Queueable, SerializesModels;

    public $commission;
    public $user;

    /**
     * Create a new message instance.
     *
     * @param float $commission
     * @param User $user
     */
    public function __construct(float $commission, User $user)
    {
        $this->commission = $commission;
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
            ->subject('New commission earned!')
            ->view('emails.commission-earned')->with([
                'commission' => $this->commission,
                'user' => $this->user
            ]);
    }
}
