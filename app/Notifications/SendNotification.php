<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;

class SendNotification extends Notification
{
    use Queueable;

    protected $title;
    protected $message;
    protected $data;
    protected $dataType;

    public function __construct($title,$message, $data = [], $dataType = 'default')
    {
        $this->title = $title;
        $this->message = $message;
        $this->data = $data;
        $this->dataType = $dataType;
    }

    public function via($notifiable)
    {
        return ['database'];
    }

    public function toArray($notifiable)
    {
        return [
            'type' => $this->dataType,
            'message' => $this->message,
            'data' => $this->data,
        ];
    }
    public function toFirebase($notifiable)
    {
        $firebase = new \App\Services\FirebaseService();

        $firebase->sendToUser(
            $notifiable->id,
            $this->title,
            $this->message,
            array_merge(['type' => $this->dataType ], $this->data)
        );
    }
}
