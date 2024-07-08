<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class partnerDetails extends Model
{
    use HasFactory;
     /**
     * The table associated with the model.
     *
     * @var string
    */
    protected $table = "partner_details";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
    */
    protected $fillable = [
        
        "coupleId",
        "coupleName",
        "age",
        "gender",
        "height",
        "dob",
        "profileImage"
       
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

    public function user () 
    {
        return  $this->belongsTo(User::class,'userId');
    }
}
