<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Interests extends Model
{
    use HasFactory;

    protected $with = ['interest'];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "interests";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [

        "userId",
        "interestId"

    ];
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'created_at',
        'updated_at',
    ];
    /**
     * Indicates whether the model should use timestamp columns.
     *
     * @var bool
     */
    public $timestamps = true; // Add this line to enable timestamps

    public function user()
    {
        return  $this->belongsTo(User::class, 'userId');
    }
    public function interest()
    {
        return  $this->belongsTo(AllInterests::class, 'interestId');
    }
}
