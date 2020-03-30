<?php

namespace App\Jobs;

use App\Commission;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CalculateCommission implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $user;
    protected $payment;

    /**
     * Create a new job instance.
     *
     * @param array $arguments
     */
    public function __construct(array $arguments)
    {
        $this->user = $arguments['user'];
        $this->payment = $arguments['payment'];
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // register commission
        Commission::create([
            'payment_id' => $this->payment->id,
            'affiliate_code' => $this->user->affiliate_code,
            'commission_type' => 1,
            'amount' => $this->payment->amount * 0.01
        ]);
    }
}
