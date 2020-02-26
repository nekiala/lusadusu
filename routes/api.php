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
