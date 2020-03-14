<?php

namespace App\Http\Controllers;

use App\Exam;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ResultController extends Controller
{
    /**
     * This method check if the user has succeeded
     * @param string $exam_code a data that contains the user id, date and exam id (UID.DD.EID)
     * @return JsonResponse
     */
    public function check(string $exam_code)
    {
        $request_data = explode(sprintf(".%s.", date("d")), $exam_code);

        // the size must be 2: [0] is the user id, [1] the exam_id
        if (sizeof($request_data) == 2) {

            $user_id = intval($request_data[0]);
            $exam_id = intval($request_data[1]);

            // both user_id and exam_id must be valid integer (> 0)
            if ($exam_id && $user_id) {

                // now check if there is an exam for that user

                $exam = Exam::where(['user_id' => $user_id, 'id' => $exam_id])->first();

                // if there is an exam, the return the result
                if ($exam) {

                    // if the user finished the exam, then return the result
                    if ($exam->started && !is_null($exam->finished_at)) {

                        $response_data = [
                            'percentage_obtained' => $exam->percentage_obtained,
                            'percentage_required' => $exam->percentage_required,
                            'passed' => $exam->passed,
                            'status' => true
                        ];

                        return response()->json($response_data, 200);

                    } else {

                        $response_data = [
                            'status' => false // the exam has not yet started or not yet finished
                        ];

                        return response()->json($response_data, 200);
                    }

                }

            }
        }

        return response()->json(null, 404);
    }
}
