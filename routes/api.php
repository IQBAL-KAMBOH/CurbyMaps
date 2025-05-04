<?php

use App\Http\Controllers\authController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UploadImageController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\PrivacyPolicyController;


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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user() ?? 'Not Login';
});

//Auth Controller
Route::post('/register', 'App\Http\Controllers\authController@register');
Route::post('/login', 'App\Http\Controllers\authController@login');
Route::put('/update/{id}', 'App\Http\Controllers\authController@userUpdate');
//Couples categories route post,get.,update,delete

Route::post('send-otp', [authController::class, 'sendOTP']);
Route::post('verify-otp', [authController::class, 'verifyOTP']);
Route::post('verify-phone', [authController::class, 'verifyRegisterOTP']);

//login user password forget
Route::post('forget/password', 'App\Http\Controllers\ProfileController@forgetPassword');

//Building Controller
Route::middleware('auth:sanctum')->group(function () {

    //authController
    Route::post('/users/edituser', 'App\Http\Controllers\authController@editUser');
    //all users get
    Route::get('fatch/all/users', 'App\Http\Controllers\authController@allUser');
    //logout
    Route::post('/logout', 'App\Http\Controllers\authController@userLogout');
    //login user password change
    Route::post('change/password', 'App\Http\Controllers\ProfileController@changePassword');
    //admin info data
    Route::get('admin/info', 'App\Http\Controllers\authController@adminInfo');
    //Couples Partner route post,get.,update,delete
    //Image upload end point
    Route::apiResource('upload/image', UploadImageController::class);
    //FAQ Route
    Route::apiResource('faq', FAQController::class);
    //privacy policy Route
    Route::apiResource('privacy/policy', PrivacyPolicyController::class);
    Route::get('user/image', [UploadImageController::class, 'usersImage']);
});

Route::any('{any}', 'App\Http\Controllers\authController@handle')->where('any', '.*');
