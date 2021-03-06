<?php

namespace App\Http\Controllers;

use App\AffiliateMember;
use App\Balance;
use App\Http\Traits\CodeGeneratorTrait;
use App\Jobs\CalculateCommission;
use App\Mail\NewCommissionCollected;
use App\Mail\PaymentCompletedMail;
use App\Payment;
use App\PaymentMethod;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class PaymentController extends Controller
{
    use CodeGeneratorTrait;

    public function index()
    {
        $payments = Payment::paginate();

        return response()->json($payments, 200);
    }

    public function show(Payment $payment)
    {
        return $payment;
    }

    /**
     * Check for a payment
     * @param Request $request
     * @return JsonResponse
     */
    public function check(Request $request)
    {
        $user_id = intval($request->get('user_id'));
        $course_id = intval($request->get('course_id'));

        // check if there is a payment
        $payment = Payment::where(['user_id' => $user_id, 'course_id' => $course_id])
            ->orderBy('id', 'DESC')
            ->first();

        // if there isn't a payment for this course
        // return a 404 status
        if (!$payment) {

            return response()->json(null, 404);
        }

        // if there isn't a completed payment for this course
        // return a 404 status
        if (!$payment->status) {

            return response()->json(null, 402);
        }

        // there is a payment for this course

        return response()->json(null, 200);
    }

    /**
     * Check for a payment
     * @param Request $request
     * @return JsonResponse
     */
    public function verify(Request $request)
    {
        $user_id = intval($request->get('user_id'));
        $course_id = intval($request->get('course_id'));
        $transaction_code = sprintf("P%d-%s", $user_id, strval($request->get('transaction_code')));

        // check if there is a payment
        $payment = Payment::where([
            'user_id' => $user_id, 'course_id' => $course_id, 'transaction_code' => $transaction_code,
            'status' => 1
        ])->first();

        // if there isn't a payment for this course
        // return a 404 status
        if (!$payment) {

            return response()->json(null, 402);
        }

        return response()->json([
            "lecture_mode" => $payment->lecture_mode
        ], 202);
    }

    public function store(Request $request)
    {
        $payment = Payment::create($request->all());

        return response()->json($payment, 201);
    }

    public function update(Request $request, Payment $payment)
    {
        $payment->update($request->all());

        return response()->json($payment, 200);
    }

    public function change(Request $request, Payment $payment)
    {
        $payment->update($request->all());

        return response()->json($payment, 200);
    }

    public function delete(Payment $payment)
    {
        try {

            $payment->delete();

        } catch (\Exception $e) {

        }

        return response()->json(null, 204);
    }

    public function gateway(Request $request)
    {
        // prepare request data
        $api_key = env('GATEWAY_API_KEY');
        $amount = strval($request->get('amount'));
        $currency = strval($request->get('currency'));
        $phone_number = strval($request->get('phone_number'));
        $endpoint = strval($request->get('endpoint'));
        $transaction_type = 2;
        $user_id = intval($request->get('user_id'));
        $transaction_code = sprintf("P%d-%s", $user_id, $this->generatePaymentCode($user_id));
        $callback_url = sprintf(env('API_CALLBACK_URL'), $transaction_code);
        $language = $request->get('language');

        $description = "Test Payment NTOPROG";

        $data = [
            'api_key' => $api_key,
            'endpoint' => $endpoint,
            'amount' => $amount,
            'currency' => $currency,
            'trans_code' => $transaction_code,
            'phone_number' => $phone_number,
            'transaction_type' => $transaction_type,
            'description' => $description,
            'callback_url' => $callback_url,
            'language' => $language
        ];

        $payload = http_build_query($data);

        // for proxy need
        $proxy_address = "10.80.1.1:90";
        $proxy_auth = "kiala.o:Infoset1@";

        // Prepare new cURL resource
        $ch = curl_init('https://gateway.ntoprog.org/api/transactions');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLINFO_HEADER_OUT, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

        // setting up proxy
        /*curl_setopt($ch, CURLOPT_PROXY, $proxy_address);
        curl_setopt($ch, CURLOPT_PROXYUSERPWD, $proxy_auth);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);*/

        // Submit the POST request
        $result = curl_exec($ch);

        $error_message = null;

        if (curl_errno($ch)) {

            $error_message = curl_errno($ch);
        }

        // Close cURL session handle
        curl_close($ch);

        if ($result) {

            Payment::create([
                'payment_method_id' => PaymentMethod::where('prefix', $endpoint)->first()->id,
                'user_id' => $user_id,
                'course_id' => intval($request->get('course_id')),
                'amount' => $amount,
                'transaction_code' => $transaction_code,
                'lecture_mode' => strval($request->get('lecture_mode'))
            ]);

            return response()->json($result, 204);
        }


        return response()->json($error_message, 202);

    }

    public function callback(Request $request, $transaction_code)
    {
        $payment = Payment::where('transaction_code', strval($transaction_code))->first();

        $valid_codes = [0, 200]; // 200 for om

        $payment->status = in_array(intval($request->get('code')), $valid_codes) ? 1 : 0;

        $payment->save();

        // if the payment is successful, then
        // check for affiliation
        // if the user is affiliated, give some points to hist up line
        if ($affiliateMember = AffiliateMember::where('member_id', $payment->user_id)->first()) {

            $user = $affiliateMember->affiliate->user;

            // register commission
            /*Commission::create([
                'payment_id' => $payment->id,
                'affiliate_code' => $user->affiliate_code,
                'commission_type' => 1,
                'amount' => $payment->amount * 0.01
            ]);*/

            if ($payment->status) {

                // calculate commissions
                CalculateCommission::dispatch([
                    'user' => $user,
                    'payment' => $payment
                ])->delay(now()->addMinutes(1));

                // update balance also
                if ($balance = Balance::where('user_id', $user->id)->first()) {

                    $balance->participation_commission += $payment->amount * 0.01;
                    $balance->save();
                }

                // send email
                Mail::to($payment->user)->queue(new PaymentCompletedMail($payment, $payment->user));

                // notify the up line affiliate member about his new commission
                Mail::to($user)->queue(new NewCommissionCollected($payment->amount * 0.01, $user));
            }
        }

        return response()->json([
            'payment' => $payment,
            'code' => $request->get('code'),
            'message' => $request->get('message'),
        ], 201);
    }

    /**
     * This method resend confirmation code to the user
     * @param Request $request
     * @return JsonResponse
     */
    public function mail(Request $request)
    {
        $user_id = intval($request->get('user_id'));
        $course_id = intval($request->get('course_id'));

        if ($payment = Payment::where(['course_id' => $course_id, 'user_id' => $user_id])->first()) {

            // send email
            Mail::to($payment->user)->queue(new PaymentCompletedMail($payment, $payment->user));

            return response()->json(null, 204);

        }

        return response()->json(null, 404);
    }
}
