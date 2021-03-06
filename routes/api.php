<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function () {

    Route::post('/login', 'UserController@login');
    Route::post('/register', 'UserController@register');
    Route::get('/logout', 'UserController@logout')->middleware('auth:api');

});

Route::post('logout', 'Auth\LoginController@logout');
Route::post('register', 'Auth\RegisterController@register');

Route::get('affiliates', 'AffiliateController@index');
Route::get('affiliates/{affiliate}', 'AffiliateController@show');
Route::post('affiliates', 'AffiliateController@store');
Route::put('affiliates/{affiliate}', 'AffiliateController@update');
Route::delete('affiliates/{affiliate}', 'AffiliateController@delete');
Route::get('affiliates/{affiliate}/members', 'AffiliateController@members');
Route::post('affiliates/member', 'AffiliateController@member');

Route::get('genders', 'GenderController@index');
Route::get('genders/{gender}', 'GenderController@show');
Route::post('genders', 'GenderController@store');
Route::put('genders/{gender}', 'GenderController@update');
Route::delete('genders/{gender}', 'GenderController@delete');

Route::get('cities', 'CityController@index');
Route::get('cities/{city}', 'CityController@show');
Route::post('cities', 'CityController@store');
Route::put('cities/{city}', 'CityController@update');
Route::delete('cities/{city}', 'CityController@delete');

Route::get('users', 'UserController@index');
Route::get('users/learners', 'UserController@learners');
Route::get('users/affiliate/{id}', 'UserController@affiliate');
Route::get('users/{user}', 'UserController@show');
Route::post('users', 'UserController@store');
Route::put('users/{user}/update', 'UserController@update');
Route::delete('users/{user}/delete', 'UserController@delete');
Route::get('users/{user}/profile', 'UserController@profile');

Route::get('categories', 'CategoryController@index');
Route::get('categories/active/{user}', 'CategoryController@user');
Route::get('categories/active', 'CategoryController@active');
Route::get('categories/{category}', 'CategoryController@show');
Route::post('categories', 'CategoryController@store');
Route::put('categories/{category}', 'CategoryController@update');
Route::delete('categories/{category}', 'CategoryController@delete');
Route::patch('categories/{category}', 'CategoryController@status');

Route::get('questions', 'QuestionController@index');
Route::get('questions/latest/{user}/{limit}', 'QuestionController@latest');
Route::get('questions/{question}', 'QuestionController@show');
Route::get('questions/{question}/discussion', 'QuestionController@discussion');
Route::post('questions', 'QuestionController@store');
Route::put('questions/{question}', 'QuestionController@update');
Route::delete('questions/{question}', 'QuestionController@delete');
Route::patch('questions/{question}', 'QuestionController@status');

Route::get('discussions', 'DiscussionController@index');
Route::get('discussions/{discussion}', 'DiscussionController@show');
Route::post('discussions', 'DiscussionController@store');
Route::put('discussions/{discussion}', 'DiscussionController@update');
Route::delete('discussions/{discussion}', 'DiscussionController@delete');

Route::get('profiles', 'ProfileController@index');
Route::get('profiles/{profile}', 'ProfileController@show');
Route::post('profiles', 'ProfileController@store');
Route::patch('profiles', 'ProfileController@verify');
Route::put('profiles/check', 'ProfileController@check');
Route::put('profiles/{profile}', 'ProfileController@update');
Route::delete('profiles/{profile}', 'ProfileController@delete');

Route::get('materials', 'MaterialController@index');
Route::get('materials/courses', 'MaterialController@listWithCourses');
Route::get('materials/user', 'MaterialController@listWithCourses');
Route::get('materials/{material}', 'MaterialController@show');
Route::post('materials', 'MaterialController@store');
Route::put('materials/{material}', 'MaterialController@update');
Route::patch('materials/{material}', 'MaterialController@status');
Route::delete('materials/{material}', 'MaterialController@delete');
Route::get('materials/{material}/courses', 'MaterialController@courses');
Route::get('materials/{material}/user/{id}', 'MaterialController@userCourses');
Route::get('materials/stats/{id}', 'MaterialController@stats');

Route::get('courses', 'CourseController@index');
Route::get('courses/{course}', 'CourseController@show');
Route::post('courses', 'CourseController@store');
Route::put('courses/{course}', 'CourseController@update');
Route::patch('courses/{course}', 'CourseController@status');
Route::delete('courses/{course}', 'CourseController@delete');
Route::get('courses/{course}/lessons', 'CourseController@lessons');
Route::post('courses/import/{material}', 'CourseController@import');

Route::get('lessons', 'LessonController@index');
Route::get('lessons/{lesson}', 'LessonController@show');
Route::post('lessons', 'LessonController@store');
Route::put('lessons/{lesson}', 'LessonController@update');
Route::patch('lessons/{lesson}', 'LessonController@change');
Route::delete('lessons/{lesson}', 'LessonController@delete');
Route::get('lessons/{lesson}/quizzes', 'LessonController@quizzes');
Route::post('lessons/import/{course}', 'LessonController@import');

Route::get('modes', 'ModeController@index');
Route::get('modes/{mode}', 'ModeController@show');
Route::post('modes', 'ModeController@store');
Route::put('modes/{mode}', 'ModeController@update');
Route::patch('modes/{mode}', 'ModeController@change');
Route::delete('modes/{mode}', 'ModeController@delete');

Route::get('quizzes', 'QuizController@index');
Route::get('quizzes/{quiz}', 'QuizController@show');
Route::post('quizzes', 'QuizController@store');
Route::patch('quizzes/get', 'QuizController@get')->name('quizzes.get');
Route::put('quizzes/{quiz}', 'QuizController@update');
Route::patch('quizzes/{quiz}', 'QuizController@change');
Route::delete('quizzes/{quiz}', 'QuizController@delete');
Route::get('quizzes/{quiz}/assertions', 'QuizController@assertions');
Route::post('quizzes/import/{lesson}', 'QuizController@import');

Route::get('assertions', 'AssertionController@index');
Route::get('assertions/{assertion}', 'AssertionController@show');
Route::post('assertions', 'AssertionController@store');
Route::put('assertions/{assertion}', 'AssertionController@update');
Route::patch('assertions/{assertion}', 'AssertionController@change');
Route::delete('assertions/{assertion}', 'AssertionController@delete');
Route::post('assertions/import/{quiz}', 'AssertionController@import');

Route::get('exams', 'ExamController@index');
Route::put('exams/prepare', 'ExamController@prepare');
Route::get('exams/today', 'ExamController@today');
Route::get('exams/{exam}', 'ExamController@show');
Route::post('exams', 'ExamController@store');
Route::put('exams/{exam}', 'ExamController@update');
Route::patch('exams/{exam}', 'ExamController@change');
Route::delete('exams/{exam}', 'ExamController@delete');
Route::patch('exams/{exam}/start', 'ExamController@start');
Route::put('exams/{exam}/close', 'ExamController@close');
Route::get('exams/stats/{id}', 'ExamController@stats');
Route::get('exams/completed/{id}/{code}', 'ExamController@completed');

// payment methods
Route::get('methods', 'PaymentMethodController@index');
Route::get('methods/active', 'PaymentMethodController@active');
Route::get('methods/{method}', 'PaymentMethodController@show');
Route::post('methods', 'PaymentMethodController@store');
Route::put('methods/{method}', 'PaymentMethodController@update');
Route::patch('methods/{method}', 'PaymentMethodController@change');
Route::delete('methods/{method}', 'PaymentMethodController@delete');

Route::get('payments', 'PaymentController@index');
Route::put('payments/check', 'PaymentController@check');
Route::put('payments/verify', 'PaymentController@verify');
Route::put('payments/mail', 'PaymentController@mail');
Route::get('payments/{payment}', 'PaymentController@show');
Route::post('payments', 'PaymentController@store');
Route::put('payments/{payment}', 'PaymentController@update');
Route::patch('payments/{payment}', 'PaymentController@change');
Route::delete('payments/{payment}', 'PaymentController@delete');
Route::post('payments/gateway', 'PaymentController@gateway');
Route::post('payments/callback/{trans}', 'PaymentController@callback');

Route::get('balances/user/{id}', 'BalanceController@user');
Route::resource('/balances', 'BalanceController');

Route::get('commissions/user/{id}', 'CommissionController@user');
Route::resource('/commissions', 'CommissionController');
Route::resource('/answers', 'AnswerController');

Route::get('results/check/{code}', 'ResultController@check');

// Dashboard
Route::get('/dashboard', 'DashboardController@dashboard');
