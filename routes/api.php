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

Route::get('affiliates', 'AffiliateController@index');
Route::get('affiliates/{affiliate}', 'AffiliateController@show');
Route::post('affiliates', 'AffiliateController@store');
Route::put('affiliates/{affiliate}', 'AffiliateController@update');
Route::delete('affiliates/{affiliate}', 'AffiliateController@delete');
Route::get('affiliates/{affiliate}/members', 'AffiliateController@members');
