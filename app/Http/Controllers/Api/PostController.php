<?php

// app/Http/Controllers/Api/PostController.php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index(Request $request)
    {
        $query = Post::with('user')->withCount(['likes', 'comments']);

        if ($request->filter === 'following') {
            $followingIds = $request->user()->following()->pluck('users.id');
            $query->whereIn('user_id', $followingIds);
        }

        $posts = $query->get();
        return PostResource::collection($posts);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'content' => 'required|string|max:1000',
            'image' => 'nullable|image|max:5120', // 5MB max
        ]);


         if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imagePath = $image->store('posts', 'public'); // stores relative path

            // Save full URL in the database
            $validated['image_path'] = asset('storage/' . $imagePath);
        }

        $post = $request->user()->posts()->create($validated);
        $post->load('user'); // Load user relationship for the resource

        return new PostResource($post);
    }

    public function show(Post $post)
    {
        $post->load('user')->loadCount(['likes', 'comments']);
        return new PostResource($post);
    }

    public function destroy(Post $post)
    {
        // Use a policy for authorization
        // $this->authorize('delete', $post);
        $post->delete();
        return response()->json(['message' => 'Post Deleted.']);
    }

    // Custom method for liking a post
    public function like(Request $request, Post $post)
    {
        $post->likes()->firstOrCreate(['user_id' => $request->user()->id]);
        return response()->json(['message' => 'Post liked.']);
    }

    // Custom method for unliking a post
    public function unlike(Request $request, Post $post)
    {
        $post->likes()->where('user_id', $request->user()->id)->delete();
        return response()->json(['message' => 'Post unliked.']);
    }
}