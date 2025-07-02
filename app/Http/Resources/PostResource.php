<?php
// app/Http/Resources/PostResource.php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class PostResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'content' => $this->content,
            'image_url' => $this->image_path ? $this->image_path : null,
            'created_at_human' => $this->created_at->diffForHumans(),
            'likes' => $this->whenLoaded('likes'),
            'likes_count' => $this->whenCounted('likes'),
            'comments' => $this->whenLoaded('comments'),
            'comments_count' => $this->whenCounted('comments'),
            'is_liked_by_user' => $this->when(auth()->check(), function () {
                // Check if the authenticated user has liked this post
                return $this->likes()->where('user_id', auth()->id())->exists();
            }),
            'user' => new UserResource($this->whenLoaded('user')),
        ];
    }
}
