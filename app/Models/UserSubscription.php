<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSubscription extends Model
{
    use HasFactory;
    protected $with = ['subsription'];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "user_subscriptions";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'userId',
        'subscriptionId',
        'receiptData',
        'expiryDate',
        'status'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'receiptData'
    ];
    /**
     * Indicates whether the model should use timestamp columns.
     *
     * @var bool
     */
    public $timestamps = true; // Add this line to enable timestamps


    public function subsription()
    {
        return $this->belongsTo(Subscription::class, 'subscriptionId');
    }
}
