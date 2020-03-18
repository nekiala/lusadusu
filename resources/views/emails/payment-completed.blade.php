<p>Hey {{$user->name}} !</p>

<p>Your payment of CDF{{ $payment->amount }} has been completed!</p>
<p>You can check it with the transaction code <strong>{{ substr($payment->transaction_code, strpos($payment->transaction_code, '-') + 1) }}</strong></p>
<p>Thanks.</p>
