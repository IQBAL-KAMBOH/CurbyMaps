<?php

// app/Http/Controllers/Api/FollowController.php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use App\Services\FirebaseService;
use App\Notifications\SendNotification;

class FollowController extends Controller
{
    public function store(Request $request, User $user)
    {
        // Validate that the user is not trying to follow themselves
        if ($request->user()->id === $user->id) {
            return response()->json(['message' => 'You cannot follow yourself.'], 400);
        }
        // Check if the user is already followed
        if ($request->user()->following()->where('following_id', $user->id)->exists()) {
            return response()->json(['message' => 'You are already following this user.'], 400);
        }
        // Follow the user
        if (!$user->exists) {
            return response()->json(['message' => 'User not found.'], 404);
        }

        $request->user()->following()->attach($user->id);
        // Notify the user being followed
        $notification = new SendNotification(
            'New Follower',
            'You have a new follower: ' . $request->user()->full_name,
            ['follower_id' => $request->user()->id],
            'followed'
        );
        $user->notify($notification);
        $notification->toFirebase($user);
        return response()->json(['message' => 'User followed successfully.']);
    }

    public function destroy(Request $request, User $user)
    {
        $request->user()->following()->detach($user->id);
        return response()->json(['message' => 'User unfollowed successfully.']);
    }
}
