<?php

namespace App\Http\Controllers;

use App\Exam;
use App\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
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
        $payment = Payment::where(['user_id' => $user_id, 'course_id' => $course_id])->first();

        // if there isn't a payment for this course
        // return a 404 status
        if (!$payment) {

            return response()->json(null, 404);
        }

        // if there isn't a completed payment for this course
        // return a 404 status
        if (!$payment->status) {

            return response()->json(null, 404);
        }

        // there is a payment for this course

        return response()->json(null, 200);
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
}
