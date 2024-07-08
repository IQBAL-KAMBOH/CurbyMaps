<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Conditions extends Model
{
    use HasFactory;
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "conditions";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [

        "termsCondition"

    ];
    /**
     * Indicates whether the model should use timestamp columns.
     *
     * @var bool
     */
    public $timestamps = true; // Add this line to enable timestamps
}
