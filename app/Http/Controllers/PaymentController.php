<?php

namespace App\Http\Controllers;

use App\Exam;
use App\Http\Traits\CodeGeneratorTrait;
use App\Payment;
use App\PaymentMethod;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    use CodeGeneratorTrait;

    public function index()
    {
        $payments = Payment::all();

        return response()->json($payments, 200);
    }

    public function show(Payment $payment)
    {
        return $payment;
    }

    /**
     * Check for a payment
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
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
     * @return \Illuminate\Http\JsonResponse
     */
    public function verify(Request $request)
    {
        $user_id = intval($request->get('user_id'));
        $course_id = intval($request->get('course_id'));
        $transaction_code = sprintf("P%d-%s", $user_id, strval($request->get('transaction_code')));

        // check if there is a payment
        $payment = Payment::where([
            'user_id' => $user_id, 'course_id' => $course_id, 'transaction_code' => $transaction_code
        ])->first();

        // if there isn't a payment for this course
        // return a 404 status
        if (!$payment) {

            return response()->json(null, 402);
        }

        // there is a payment for this course
        // get exam details
        $exam = Exam::where([
            'user_id' => $user_id, 'course_id' => $course_id
        ])->first();

        return response()->json([
            "lecture_mode" => $payment->lecture_mode,
            "exam_id" => intval($exam->id)
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
        $payment->delete();

        return response()->json(null, 204);
    }

    public function gateway(Request $request)
    {


        // check for phone number prefix
        $api_key = env('GATEWAY_API_KEY');
        $amount = strval($request->get('amount'));
        $currency = strval($request->get('currency'));
        $phone_number = strval($request->get('phone_number'));
        $endpoint = strval($request->get('endpoint'));
        $transaction_type = 2;
        $user_id = intval($request->get('user_id'));
        $transaction_code = sprintf("P%d-%s", $user_id, $this->generatePaymentCode());
        $callback_url = sprintf(env('API_CALLBACK_URL'), $transaction_code);

        $data = [
            'api_key' => $api_key,
            'endpoint' => $endpoint,
            'amount' => $amount,
            'currency' => $currency,
            'trans_code' => $transaction_code,
            'phone_number' => $phone_number,
            'transaction_type' => $transaction_type,
            'description' => "Test Payment NTOPROG",
            'callback_url' => $callback_url
        ];

        $payload = http_build_query($data);

        // Prepare new cURL resource
        $ch = curl_init('https://gateway.ntoprog.org/api/transactions');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLINFO_HEADER_OUT, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

        // Submit the POST request
        $result = curl_exec($ch);

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

        return response()->json($result, 202);

    }

    public function callback(Request $request, $transaction_code)
    {
        $payment = Payment::where('transaction_code', strval($transaction_code))->first();

        $payment->status = intval($request->get('code')) == 200 ? 1 : 0;

        $payment->save();

        return response()->json([
            'payment' => $payment,
            'code' => $request->get('code'),
            'message' => $request->get('message'),
        ], 201);
    }
}
