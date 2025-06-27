<?php

// app/Http/Resources/CommentResource.php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CommentResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'body' => $this->body,
            'created_at_human' => $this->created_at->diffForHumans(),
            'user' => new UserResource($this->whenLoaded('user')),
        ];
    }
}
