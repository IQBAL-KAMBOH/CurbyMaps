<?php

// app/Http/Resources/UserResource.php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserPostResource extends JsonResource
{

    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'userRole' => (string) $this->userRole, // Casting to string to match your example
            'full_name' => $this->full_name,
            'email' => $this->email,
            'city' => $this->city,
            'post_code' => $this->post_code,
            'PhoneNo' => $this->PhoneNo,
            'car_number' => $this->car_number,
            'car_model' => $this->car_model,
            'language' => $this->language,
            'bio' => $this->bio,
            // The accessor from the User model provides the full URL
            'profileImage' => $this->profile_image,
            'status' => (string) $this->status,

            // **IMPORTANT**: This includes the FULL user object for each follower/following.
            // It re-uses the UserResource for each item in the collection.
            'followers' => UserResource::collection($this->whenLoaded('followers')),
            'following' => UserResource::collection($this->whenLoaded('following')),
            // Use the PostResource for the posts collection
            'posts' => PostResource::collection($this->whenLoaded('posts')),
        ];
    }

}
