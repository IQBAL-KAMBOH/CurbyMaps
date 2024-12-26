<?php

use App\Http\Controllers\authController;
use App\Http\Controllers\ChatMessageController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CouplesController;
use App\Http\Controllers\CouplesPartnerController;
use App\Http\Controllers\InterestsController;
use App\Http\Controllers\UploadImageController;
use App\Http\Controllers\FriendRequestController;
use App\Http\Controllers\SubscriptionController;
use App\Http\Controllers\UserSubscriptionController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\PrivacyPolicyController;
use App\Http\Controllers\ConditionsController;

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
    return $request->user();
});

//Auth Controller
Route::post('/users/register', 'App\Http\Controllers\authController@register');
Route::post('/users/login', 'App\Http\Controllers\authController@login');
Route::put('/users/update/{id}', 'App\Http\Controllers\authController@userUpdate');
//Couples categories route post,get.,update,delete
Route::apiResource('couples/categories', CouplesController::class);
Route::post('send-otp', [authController::class, 'sendOTP']);
Route::post('verify-otp', [authController::class, 'verifyOTP']);
Route::post('verify-phone', [authController::class, 'verifyRegisterOTP']);
//Admin Fetch interests
Route::get('fetch/interests', [InterestsController::class, 'fetchAdminInterests']);
//login user password forget
Route::post('forget/password', 'App\Http\Controllers\ProfileController@forgetPassword');

//Building Controller
Route::middleware('auth:sanctum')->group(function () {

    //authController
    Route::post('/users/edituser', 'App\Http\Controllers\authController@editUser');
    //all users get
    Route::get('fatch/all/users', 'App\Http\Controllers\authController@allUser');
    //required doctorCategories=id (Category id after fatch data)
    Route::get('fatch/Category/users', 'App\Http\Controllers\authController@fatchUsersByCategory');
    //logout
    Route::post('/logout', 'App\Http\Controllers\authController@userLogout');
    //map route
    Route::post('user/map', 'App\Http\Controllers\authController@mapStore');
    //user subsription plan get
    Route::get('user/subsription/plan', 'App\Http\Controllers\authController@FetchUserSubsription');
    //all Active users get
    Route::get('active/users', 'App\Http\Controllers\authController@fetchActiveUsers');
    //login user password change
    Route::post('change/password', 'App\Http\Controllers\ProfileController@changePassword');
    //admin info data
    Route::get('admin/info', 'App\Http\Controllers\authController@adminInfo');
    //Couples Partner route post,get.,update,delete
    Route::apiResource('couples/partner', CouplesPartnerController::class);
    //Couples Interests route post,get.,update,delete
    Route::apiResource('couples/interests', InterestsController::class);
    //Admin Add interests
    Route::post('add/interests', [InterestsController::class, 'storeAdminInterest']);

    //Admin Update interests
    Route::post('edit/interests/{id}', [InterestsController::class, 'UpdateAdminInterest']);
    //Admin Delete interests
    Route::delete('del/interests', [InterestsController::class, 'destroyAdminInterest']);
    //Image upload end point
    Route::apiResource('upload/image', UploadImageController::class);
    //send friend request with Notification post and get for friendId
    Route::apiResource('send/request', FriendRequestController::class);
    // Send Messages API's
    Route::apiResource('chat/add', ChatMessageController::class);
    //fatch massage against chatId
    Route::get('message/fatch/{id}', [ChatMessageController::class, 'chatDetails']);
    //fatch chat/list
    Route::get('chat/list', [ChatMessageController::class, 'chatList']);
    //fatch active friend for userId
    Route::get('active/friends', [FriendRequestController::class, 'fetchMatches']);
    //admin add,get,update and delete Subscription
    Route::apiResource('all/subscription', SubscriptionController::class);
    //post notification profile view
    Route::post('profile/view', [FriendRequestController::class, 'profileViews']);
    //get all user notification
    Route::get('user/notifications', [FriendRequestController::class, 'getNotifications']);
    //buy user Subscription
    Route::apiResource('buy/subscription', UserSubscriptionController::class);
    //FAQ Route
    Route::apiResource('faq', FAQController::class);
    //privacy policy Route
    Route::apiResource('privacy/policy', PrivacyPolicyController::class);
    //terms Conditions Route
    Route::apiResource('terms/condition', ConditionsController::class);
    //get map Route
    Route::get('/get_users_in_radius', [authController::class, 'getUsersInRadius']);
    //user image Route against userId
    Route::get('user/image', [UploadImageController::class, 'usersImage']);
});

Route::any('{any}', 'App\Http\Controllers\authController@handle')->where('any', '.*');
