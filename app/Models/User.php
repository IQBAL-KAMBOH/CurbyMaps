<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory, HasApiTokens, HasFactory, Notifiable;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "users";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'userRole',
        'full_name',
        'email',
        'password',
        'profileImage',
        'city',
        'post_code',
        'PhoneNo',
        'car_number',
        'car_model',
        'language',
        'bio'

    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'roleId',
        'isActive',
        'created_at',
        'updated_at',
        'email_verified_at',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'seniorityDate' => 'string'
    ];



    public function deviceTokens()
    {
        return $this->hasMany(DeviceToken::class, 'userId');
    }

    public function frequentLocations()
    {
        return $this->hasMany(FrequentLocation::class);
    }
    public function following()
    {
        return $this->belongsToMany(User::class, 'followers', 'user_id', 'following_id');
    }
    public function posts()
    {
        return $this->hasMany(Post::class);
    }
    /**
     * The users that follow this user.
     */
    public function followers()
    {
        return $this->belongsToMany(User::class, 'followers', 'following_id', 'user_id');
    }
}
