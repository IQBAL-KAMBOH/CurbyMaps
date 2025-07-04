<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'content', 'image_path'];

    /**
     * The user who created the post.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * The comments on the post.
     */
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    /**
     * The likes on the post.
     */
    public function likes()
    {
        return $this->hasMany(Like::class);
    }
}
