<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subscription extends Model
{
    use HasFactory, SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "subscriptions";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'Name',
        'price',
        'details',
        'planId',
        'productId'
    ];

    /**
     * Indicates whether the model should use timestamp columns.
     *
     * @var bool
     */
    public $timestamps = true; // Add this line to enable timestamps
}
