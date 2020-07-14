<?php

namespace App\Http\Controllers;

use App\Exam;
use App\Http\Resources\QuestionCollection;
use App\Profile;
use App\Question;
use App\Subscription;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $unsolved_tickets = Question::countUnsolved();
        $daily_passed_exams = Exam::countDailyCompletedExams();
        $daily_new_subscriptions = Subscription::countDailySubscriptions();
        $daily_new_registrations = Profile::countDailyProfiles();

        $last_ten_unsolved_tickets = new QuestionCollection(Question::getNLatestUnsolved(10));

        return response()->json([
            'ticket_count' => $unsolved_tickets,
            'new_subscriptions' => $daily_new_subscriptions,
            'passed_exams' => $daily_passed_exams,
            'registrations' => $daily_new_registrations,
            'latest' => $last_ten_unsolved_tickets
        ], Response::HTTP_OK);
    }
}
