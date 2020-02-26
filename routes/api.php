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
Route::put('users/update/{user}', 'UserController@update');
Route::delete('users/delete/{user}', 'UserController@delete');
Route::put('users/status/{user}', 'UserController@status');
