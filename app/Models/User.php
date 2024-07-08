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
        'coupleCategories',
        'userName',
        'title',
        'emailAddress',
        'password',
        'coupleName',
        'age',
        'PhoneNo',
        'gender',
        'height',
        'dob',
        'bio',
        'profileImage',
        'Latitude',
        'Longitude',
        'status',
        'email_verified_at',
        'remember_token',
        'created_at',
        'updated_at',
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

    public function partner()
    {
        return $this->hasOne(partnerDetails::class, 'coupleId');
    }
    public function subsription()
    {
        return $this->hasOne(UserSubscription::class, 'userId')->latest();
    }
    public function userInterest()
    {
        return $this->hasMany(Interests::class, 'userId');
    }
    public function deviceTokens()
    {
        return $this->hasMany(DeviceTokon::class, 'userId');
    }
    public function interests()
    {
        return $this->hasMany(Interests::class, 'userId', 'id');
    }
}
