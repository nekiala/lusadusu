<?php


namespace App\Http\Traits;


use App\Answer;
use App\Exam;
use App\Quiz;

trait ScoreCalculatorTrait
{

    private function getScore(Exam $exam)
    {
        $quizzes = Quiz::alreadyAsked($exam->id)->count();

        // if there is no asked question,
        // then the result is 0
        if (!$quizzes) return 0;

        $correctAnswers = Answer::where([
            'exam_id' => $exam->id,
            'correct_answer' => 1
        ])->count();

        return round(($correctAnswers * 100) / $quizzes, 2);
    }
}
