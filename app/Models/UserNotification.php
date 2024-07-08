<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{
    use HasFactory;
     // Add Extra Key inside a Notification's Object

     /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
    */
    protected $fillable = [
        'senderId',
        'receiverId',
        'chatId',
        'friendRequestId',
        'body',
        'type',
    ];

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s',
    ];

    // Relationships
    public function sender()
    {
        return $this->belongsTo(User::class, "senderId");
    }
    public function receiver()
    {
        return $this->belongsTo(User::class, "receiverId");
    }
    public function chat()
    {
        return $this->belongsTo(chat::class, "chatId");
    }
    public function message()
    {
        return $this->belongsTo(message::class, "messageId");
    }
    public function request()
    {
        return $this->belongsTo(FriendRequest::class, "friendRequestId");
    }

    // Insert into a table for In-App Notification
    public static function saveNotification($data)
    {
        return UserNotification::create($data);
    }

    // Send Push Notification
    public static function sendNotification($deviceToken = null, $message = null, $data = null)
    {
        $serverKey = env('FCM_TOKEN_KEY');
        $title = 'Couples konnect';
        $fcmMsg = array(
            'title' => $title,
            'body' => $message
        );
        $fcmFields = array(
            'to' => $deviceToken,
            'priority' => 'high',
            'notification' => $fcmMsg,
            'data'=> $data
        );
        $headers = array(
            "Authorization: key=$serverKey",
            'Content-Type: application/json'
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmFields));
        curl_exec($ch);
        curl_close($ch);
    }

    // Get All Notifications
    public static function getUserNotifications($userId)
    {
        $getNotifications = UserNotification::where('receiverId', auth()->id())
            ->orderBy('created_at', 'DESC')
            ->get();

        return $getNotifications->map(function ($notification) {
            $data = [
                'id' => $notification->id,
                'senderId' => (int) $notification->senderId,
                'receiverId' => (int) $notification->receiverId,
                'chatId' => $notification->chatId ? (int) $notification->chatId : null,
                'friendRequestId' => $notification->friendRequestId ? (int) $notification->friendRequestId : null,
                'body' => $notification->body,
                'type' => $notification->type,
                'created_at' => $notification->created_at,
                'updated_at' => $notification->updated_at,
            ];
            if ($notification->chatId) {
                $data['chat'] = [
                    'id' => (int) $notification->chat->id,
                    'receiverId' => (int) $notification->chat->receiverId,
                    'receiverName' => $notification->sender->userName,
                    'receiverProfilePic' => $notification->sender->profileImage,
                ];
                $data['friend'] = null;
            } else {
                $data['friend'] = [
                    "id" => (int) $notification->friendRequestId,
                    "userId" => (int) $notification->request->userId,
                    "friendId" => (int) $notification->request->friendId,
                    "status" => $notification->request->status,
                    "created_at" => $notification->request->created_at,
                    "updated_at" => $notification->request->updated_at,
                    "friendName" => $notification->sender->userName,
                    "profileImage" => $notification->sender->profileImage
                ];
                $data['chat'] = null;
            }
            return $data;        
        })->all();
    }
}
