<?php

use App\Http\Controllers\authController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UploadImageController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\PrivacyPolicyController;
use App\Http\Controllers\Api\ParkingSearchController;
use App\Http\Controllers\FrequentLocationController;
    // routes/api.php

use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\CommentController;
use App\Http\Controllers\Api\FollowController;
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
    Route::get('/parking/search/google', [ParkingSearchController::class, 'searchNearbyGoogle']);
    // Route to get details for a specific Google Place ID
    Route::get('/parking/google-place-details/{placeId}', [ParkingSearchController::class, 'getPlaceDetails']);
    Route::apiResource('frequent-locations', FrequentLocationController::class);
    Route::get('/profile', [authController::class, 'getProfile']);
    Route::post('/profile/update', [authController::class, 'updateProfile']);




    // Posts API
    Route::apiResource('posts', PostController::class)->except(['update']);
    Route::post('posts/{post}/like', [PostController::class, 'like']);
    Route::delete('posts/{post}/unlike', [PostController::class, 'unlike']);

    // Comments API (nested under posts)
    Route::get('posts/{post}/comments', [CommentController::class, 'index']);
    Route::post('posts/{post}/comments', [CommentController::class, 'store']);

    // Follow/Unfollow API
    Route::post('users/{user}/follow', [FollowController::class, 'store']);
    Route::delete('users/{user}/unfollow', [FollowController::class, 'destroy']);

});

Route::any('{any}', 'App\Http\Controllers\authController@handle')->where('any', '.*');
