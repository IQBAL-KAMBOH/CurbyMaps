<?php

namespace App\Http\Controllers;

use App\Models\chat;
use App\Models\FriendRequest;
use App\Models\message;
use App\Models\ProfileView;
use App\Models\User;
use App\Models\UserNotification;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FriendRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        try {
            $friendId = auth()->id();
            DB::beginTransaction();
            // Check if the status query parameter is present in the request
            if ($request->has('status')) {
                // Update the status based on the query parameter value
                if ($request->input('status') === 'accept') {
                    // Update the status in the database for the matching records
                    $friendRequest = FriendRequest::where('friendId', $friendId)
                        ->where('userId', $request->input('userId'))->first(); // Filter by userId from the request

                    // Check if the record already exists in the 'chats' table
                    $chat = chat::where('senderId', $request->input('userId'))
                        ->where('receiverId', $friendId)
                        ->first();

                    if (!$chat) {
                        $chat = chat::create([
                            'senderId' => $request->input('userId'),
                            'receiverId' => $friendId,
                        ]);
                        message::create([
                            'chatId' => $chat->id,
                            'senderId' => $request->input('userId'),
                            'massage' => 'Friend request accepted',
                            'massageType' => 'text'
                        ]);
                        $friendRequest->update([
                            'status' => 1,
                            'chatId' => $chat->id
                        ]);
                    } else {
                        $friendRequest->update([
                            'status' => 1,
                            'chatId' => $chat->id
                        ]);
                        // Handle the case where the record already exists
                        DB::commit();
                        return response()->json(['success' => false, 'data' => [], 'message' => 'Friend request already accepted'], 200);
                    }
                    $request->request->add(['friendId' => $request->userId]);
                    // dd($request->all());
                    $this->sendNotification($request, $friendRequest, "request_accepted");
                } else {
                    // Update the status in the database for the matching records to 'rejected'
                    FriendRequest::where('friendId', $friendId)
                        ->where('userId', $request->input('userId')) // Filter by userId from the request
                        ->update(['status' => 2]); // Assuming '2' represents 'rejected' status

                }
            }

            // Fetch the updated friend requests with join data
            $updatedFriendRequests = FriendRequest::where('friend_requests.friendId', '=', $friendId)
                ->where('friend_requests.status', 0)
                ->join('users', 'friend_requests.userId', '=', 'users.id')
                ->join('partner_details', 'friend_requests.userId', '=', 'partner_details.coupleId')
                ->select(
                    'friend_requests.*',
                    'users.userName as friendName',
                    'users.profileImage as profileImage',
                    'users.title',
                    'partner_details.id as partnerId',
                    'partner_details.coupleName as partnerName',
                    'partner_details.profileImage as partnerProfileImage',
                )->get();
            DB::commit();
            return response()->json(['success' => true, 'friend_requests' => $updatedFriendRequests], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        $userAuth = $request->header('Authorization');
        $parts = explode('|', $userAuth);
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

        if (!$user) {
            return response()->json(['success' => false, 'data' => [], 'message' => 'User not authenticated'], 401);
        }
        $userId = $user->tokenable_id;
        $request->validate([
            "friendId" => "required",
        ]);

        try {
            // Check if the user has already sent 10 requests in the last 24 hours
            $lastRequestDate = FriendRequest::where('userId', $userId)
                ->orderBy('created_at', 'desc')
                ->value('created_at');

            $requestsCount = ($lastRequestDate && now()->diffInHours($lastRequestDate) < 24)
                ? FriendRequest::where('userId', $userId)
                ->where('created_at', '>=', now()->subDay()) // Check requests from the last 24 hours
                ->count()
                : 0;

            if ($requestsCount >= 10) {
                return response()->json(['success' => false, 'data' => [], 'message' => 'Maximum requests limit reached for the day.'], 200);
            }

            // Check if the entry with the given friendId already exists
            $existingEntry = FriendRequest::where('friendId', $request->friendId)
                ->where('userId', $userId)
                ->first();

            if ($existingEntry) {
                // If the entry already exists, return an appropriate response
                return response()->json(['success' => false, 'data' => [], 'message' => 'Request already sent.'], 200);
            }
            $Data = [
                "userId"   => $userId,
                "friendId" => $request->friendId,
                "status"   => $request->status ?? 0, // Set default value to 0 if not provided in the request
            ];
            $friendRequestDetails = FriendRequest::create($Data);
            $this->sendNotification($request, $friendRequestDetails, "send_request");
            DB::commit();

            return response()->json(['success' => true, 'data' => ["id" => $friendRequestDetails->id], 'message' => "Request sent successfully"], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    private function sendNotification(Request $request, $friendRequestDetails = null, $type)
    {
        // Save Notification Details
        if ($type === 'send_request') {
            $notificationMessage = auth()->user()->userName . " sents you a friend request.";
        } else if ($type === 'request_accepted') {
            $notificationMessage = auth()->user()->userName . " accepted your friend request.";
        } else {
            $notificationMessage = auth()->user()->userName . " views your profile.";
        }
        UserNotification::saveNotification([
            'senderId' => auth()->id(),
            'receiverId' => $request->friendId,
            'friendRequestId' => isset($friendRequestDetails) ? $friendRequestDetails->id : null,
            'body' => $notificationMessage,
            'type' => $type
        ]);
        $otherUser = User::find($request->friendId);
        // Send FCM Notification
        if (count($otherUser->deviceTokens)) {
            foreach ($otherUser->deviceTokens as $deviceToken) {
                $notificationData = [
                    'senderId' => auth()->id(),
                    'receiverId' => $request->friendId,
                    'friendRequestId' => isset($friendRequestDetails) ? $friendRequestDetails->id : null,
                    'senderDetails' => auth()->user(),
                    'type' => $type
                ];
                UserNotification::sendNotification($deviceToken->token, $notificationMessage, $notificationData);
            }
        }
    }
    /**
     * Display a listing fatchActiveFriend
     *
     * @return \Illuminate\Http\Response
     */
    public function fetchMatches(Request $request)
    {
        try {
            $user = auth()->user();
            $matches = $request->matches;

            $query = FriendRequest::where('friend_requests.status', '=', 1)
                ->where(function ($query) use ($user) {
                    $query->orWhere(['friend_requests.userId' => $user->id, 'friend_requests.friendId' => $user->id]);
                });

            if ($matches === 'new') {
                $startDate = Carbon::today()->subDays(7);
                $endDate = Carbon::now();
                $query->whereBetween('friend_requests.updated_at', [$startDate, $endDate]);
            } else if ($matches === 'previous') {
                $cutOffDate = Carbon::today()->subDays(7);
                $query->whereDate('friend_requests.updated_at', '>=', $cutOffDate);
            }

            // Include relationships to load additional data
            $activeFriends = $query->with(['user' => function ($query) {
                $query->select('users.*');
            }, 'user.partner', 'user.interests.interest'])
                ->join('users', 'friend_requests.userId', '=', 'users.id')
                ->select('friend_requests.*')
                ->paginate(10);

            return response()->json(['success' => true, 'message' => "", 'data' => $activeFriends], 200);
        } catch (\Throwable $exception) {
            // Return error response if any exception occurs
            return response()->json(['success' => false, 'message' => $exception->getMessage(), "data" => []], 500);
        }
    }

    public function profileViews(Request $request)
    {
        DB::beginTransaction();
        try {
            $request->validate([
                "userId" => "required",
            ]);
            $input['userId'] = $request->userId;
            $input['viewBy'] = auth()->id();
            $request->merge(['friendId' => $request->userId]);
            $this->sendNotification($request, null, 'view_profile');
            $profileView = ProfileView::create($input);
            DB::commit();
            return response()->json(['success' => true, 'message' => "Profile view Successfully.", 'data' => $profileView], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), "data" => []], 500);
        }
    }

    public function getNotifications()
    {
        DB::beginTransaction();
        try {
            $getNotifications = UserNotification::where('receiverId', auth()->id())

                  ->with('sender.partner', 'chats.messages', 'request')

                ->paginate(10);
            return response()->json(['success' => true, 'message' => "", 'data' => $getNotifications], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), "data" => []], 500);
        }
    }
}
