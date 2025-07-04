<?php

use Illuminate\Support\Facades\Route;
use App\Services\FirebaseService;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});



Route::get('/test-notification', function () {
    $userId = 2; // Change to real user ID with token
    $firebase = new FirebaseService();

    $result = $firebase->sendToUser(
        $userId,
        'Test Notification',
        'This is a test message from CurbyMaps Laravel backend',
        ['type' => 'test']
    );

    return response()->json(['result' => $result]);
});
