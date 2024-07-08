<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class message extends Model
{
    use HasFactory, SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "messages";
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'chatId',
        'senderId',
        'message',
        'messageType',
        'senderImage',
        'fileUrl',
    ];
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];
    /**
     * Indicates whether the model should use timestamp columns.
     *
     * @var bool
     */
    public $timestamps = true; // Add this line to enable timestamps

    // Relationships
    public function sender()
    {
        return $this->belongsTo(User::class, "senderId");
    }

    public function chat()
    {
        return $this->belongsTo(chat::class, "chatId");
    }
}
