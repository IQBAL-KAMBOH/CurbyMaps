<?php


namespace App\Services;

use App\Models\DeviceToken;
use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
    use Kreait\Firebase\Messaging\MulticastSendReport;

class FirebaseService
{
    protected $messaging;

    public function __construct()
    {
        $factory = (new Factory)->withServiceAccount(storage_path('app/firebase/firebase_credentials.json'));
        $this->messaging = $factory->createMessaging();
    }

    public function sendNotification($deviceToken, $title, $body, $data = [])
    {
        $message = CloudMessage::withTarget('token', $deviceToken)
            ->withNotification(Notification::create($title, $body))
            ->withData($data);

        return $this->messaging->send($message);
    }


    public function sendToUser($userId, $title, $body, $data = [])
    {
        $tokens = DeviceToken::where('userId', $userId)
            ->whereNotNull('token')
            ->pluck('token')
            ->filter()
            ->unique()
            ->values()
            ->toArray();

        if (empty($tokens)) {
            return ['status' => 'no_tokens', 'message' => 'No valid tokens found'];
        }

        $message = CloudMessage::new()
            ->withNotification(Notification::create($title, $body))
            ->withData($data);

        $report = $this->messaging->sendMulticast($message, $tokens);
$failedTokens = [];

foreach ($report->failures() as $failure) {
    if (method_exists($failure, 'target')) {
        $failedTokens[] = $failure->target()->value();
    }
}

        return [
            'success_count' => $report->successes()->count(),
            'failure_count' => $report->failures()->count(),
            'failed_tokens' => $failedTokens
        ];
    }
}
