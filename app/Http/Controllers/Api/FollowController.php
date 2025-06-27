<?php

// app/Http/Controllers/Api/FollowController.php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class FollowController extends Controller
{
    public function store(Request $request, User $user)
    {
        $request->user()->following()->attach($user->id);
        return response()->json(['message' => 'User followed successfully.']);
    }

    public function destroy(Request $request, User $user)
    {
        $request->user()->following()->detach($user->id);
        return response()->json(['message' => 'User unfollowed successfully.']);
    }
}