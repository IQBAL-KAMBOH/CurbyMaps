<?php

// app/Http/Resources/UserResource.php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'full_name' => $this->full_name, // Assuming you have a 'name' column
            'email' => $this->email, // Example: "@annkorkowski"
            'avatar_url' => $this->profileImage ?? 'https://ui-avatars.com/api/?name=' . urlencode($this->full_name),
            'followers' => $this->followers->pluck('id') ?? [],
            'following' => $this->following->pluck('id') ?? [],

            // Add more fields as needed
        ];
    }
}
