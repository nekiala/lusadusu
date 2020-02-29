<?php

namespace App\Http\Controllers;

use App\Exam;
use App\Lesson;
use App\Mode;
use Illuminate\Http\Request;

class ExamController extends Controller
{
    public function index()
    {
        $exams = Exam::all();

        return response()->json($exams, 200);
    }

    public function show(Exam $exam)
    {
        return $exam;
    }

    public function store(Request $request)
    {
        $exam =  Exam::create($request->all());

        return response()->json($exam, 201);
    }

    public function update(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, 200);
    }

    public function change(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return response()->json($exam, 200);
    }

    public function delete(Exam $exam)
    {
        $exam->delete();

        return response()->json(null, 204);
    }

    public function prepare(Request $request)
    {
        $user_id = $request->get('user_id');
        $course_id = $request->get('course_id');
        $mode_id = intval($request->get('mode_id'));

        // first of all, check if the exam doesn't exist already
        $exam = Exam::where(['user_id' => $user_id, 'course_id' => $course_id])->get();

        // if there is an exam
        // then check if it has been started
        if (isset($exam[0])) {

            $exam = $exam[0];

            // if exam has not yet started
            // return the lesson
            if (!$exam->started) {

                return response()->json($exam->lesson()->first(), 200);
            }

            // if the course has started, check if the session has not yet expired
            // the session expiration means that there is no more second
            // for that exam

            if ($exam->started) {


            }
        }

        $lesson = Lesson::randLesson($course_id);
        $mode = Mode::find($mode_id);

        $percentage_required = $mode->winning_average;

        $exam = new Exam;

        $exam->user_id = $user_id;
        $exam->course_id = $course_id;
        $exam->lesson_id = $lesson->id;
        $exam->percentage_required = $percentage_required;

        $exam->save();

        return response()->json($lesson, 200);
    }

    public function start(Exam $exam)
    {
        // first check if exam has already started
        if ($exam->started)
            return response()->json($exam, 201);

        $exam->started = true;
        $exam->started_at = date('Y-m-d H:i:s');
        $exam->save();

        return response()->json($exam, 201);
    }
}
