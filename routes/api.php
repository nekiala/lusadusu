<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
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

Route::get('parameters', 'AffiliateParameterController@index');
Route::get('parameters/{parameter}', 'AffiliateParameterController@show');
Route::post('parameters', 'AffiliateParameterController@store');
Route::put('parameters/{parameter}', 'AffiliateParameterController@update');
Route::delete('parameters/{parameter}', 'AffiliateParameterController@delete');

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
Route::get('users/{user}', 'UserController@show');
Route::put('users/{user}/update', 'UserController@update');
Route::delete('users/{user}/delete', 'UserController@delete');
Route::get('users/{user}/profile', 'UserController@profile');

Route::get('categories', 'CategoryController@index');
Route::get('categories/{category}', 'CategoryController@show');
Route::post('categories', 'CategoryController@store');
Route::put('categories/{category}', 'CategoryController@update');
Route::delete('categories/{category}', 'CategoryController@delete');

Route::get('questions', 'QuestionController@index');
Route::get('questions/{question}', 'QuestionController@show');
Route::get('questions/{question}/discussion', 'QuestionController@discussion');
Route::post('questions', 'QuestionController@store');
Route::put('questions/{question}', 'QuestionController@update');
Route::delete('questions/{question}', 'QuestionController@delete');

Route::get('questions', 'QuestionController@index');
Route::get('questions/{question}', 'QuestionController@show');
Route::post('questions', 'QuestionController@store');
Route::put('questions/{question}', 'QuestionController@update');
Route::delete('questions/{question}', 'QuestionController@delete');

Route::get('discussions', 'DiscussionController@index');
Route::get('discussions/{discussion}', 'DiscussionController@show');
Route::post('discussions', 'DiscussionController@store');
Route::put('discussions/{discussion}', 'DiscussionController@update');
Route::delete('discussions/{discussion}', 'DiscussionController@delete');

Route::get('profiles', 'ProfileController@index');
Route::get('profiles/{profile}', 'ProfileController@show');
Route::post('profiles', 'ProfileController@store');
Route::put('profiles/{profile}', 'ProfileController@update');
Route::delete('profiles/{profile}', 'ProfileController@delete');

Route::get('materials', 'MaterialController@index');
Route::get('materials/{material}', 'MaterialController@show');
Route::post('materials', 'MaterialController@store');
Route::put('materials/{material}', 'MaterialController@update');
Route::patch('materials/{material}', 'MaterialController@status');
Route::delete('materials/{material}', 'MaterialController@delete');
Route::get('materials/{material}/courses', 'MaterialController@courses');

Route::get('courses', 'CourseController@index');
Route::get('courses/{course}', 'CourseController@show');
Route::post('courses', 'CourseController@store');
Route::put('courses/{course}', 'CourseController@update');
Route::patch('courses/{course}', 'CourseController@status');
Route::delete('courses/{course}', 'CourseController@delete');
Route::get('courses/{course}/lessons', 'CourseController@lessons');

Route::get('lessons', 'LessonController@index');
Route::get('lessons/{lesson}', 'LessonController@show');
Route::post('lessons', 'LessonController@store');
Route::put('lessons/{lesson}', 'LessonController@update');
Route::patch('lessons/{lesson}', 'LessonController@change');
Route::delete('lessons/{lesson}', 'LessonController@delete');
Route::get('lessons/{lesson}/quizzes', 'LessonController@quizzes');

Route::get('modes', 'ModeController@index');
Route::get('modes/{mode}', 'ModeController@show');
Route::post('modes', 'ModeController@store');
Route::put('modes/{mode}', 'ModeController@update');
Route::patch('modes/{mode}', 'ModeController@change');
Route::delete('modes/{mode}', 'ModeController@delete');

Route::get('quizzes', 'QuizController@index');
Route::get('quizzes/{quiz}', 'QuizController@show');
Route::post('quizzes', 'QuizController@store');
Route::put('quizzes/{quiz}', 'QuizController@update');
Route::patch('quizzes/{quiz}', 'QuizController@change');
Route::delete('quizzes/{quiz}', 'QuizController@delete');
Route::get('quizzes/{quiz}/assertions', 'QuizController@assertions');

Route::get('assertions', 'AssertionController@index');
Route::get('assertions/{assertion}', 'AssertionController@show');
Route::post('assertions', 'AssertionController@store');
Route::put('assertions/{assertion}', 'AssertionController@update');
Route::patch('assertions/{assertion}', 'AssertionController@change');
Route::delete('assertions/{assertion}', 'AssertionController@delete');

Route::get('exams', 'ExamController@index');
Route::get('exams/{exam}', 'ExamController@show');
Route::post('exams', 'ExamController@store');
Route::put('exams/{exam}', 'ExamController@update');
Route::patch('exams/{exam}', 'ExamController@change');
Route::delete('exams/{exam}', 'ExamController@delete');
