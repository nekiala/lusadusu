<?php

namespace App\Mail;

use App\Exam;
use App\Payment;
use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PaymentCompletedMail extends Mailable
{
    use Queueable, SerializesModels;

    public $payment;
    public $user;

    /**
     * Create a new message instance.
     *
     * @param Payment $payment
     * @param User $user
     */
    public function __construct(Payment $payment, User $user)
    {
        $this->payment = $payment;
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
            ->subject('Your payment is completed ' . $this->user->name)
            ->view('emails.payment-completed')->with([
                'user' => $this->user,
                'payment' => $this->payment
            ]);
    }
}
