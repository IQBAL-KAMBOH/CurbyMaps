<?php

// app/Http/Controllers/Api/CommentController.php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CommentResource;
use App\Models\Post;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index(Post $post)
    {
        $comments = $post->comments()->with('user')->get();
        return CommentResource::collection($comments);
    }

    public function store(Request $request, Post $post)
    {
        $validated = $request->validate(['body' => 'required|string|max:500']);

        $comment = $post->comments()->create([
            'user_id' => $request->user()->id,
            'body' => $validated['body'],
        ]);

        $comment->load('user');

        return new CommentResource($comment);
    }
}