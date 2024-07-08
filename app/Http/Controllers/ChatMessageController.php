<?php

namespace App\Http\Controllers;

use App\Models\chat;
use App\Models\message;
use App\Models\UserNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ChatMessageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function chatDetails(Request $request, $id)
    {
        try {
            $getChatDetails = chat::with([
                'messages',
                'sender' => function ($query) {
                    $query->select('id', 'userName', 'title', 'coupleName', 'profileImage');
                }, 'receiver' => function ($query) {
                    $query->select('id', 'userName', 'title', 'coupleName', 'profileImage');
                }
            ])->find($id);
            if (!$getChatDetails) {
                return response()->json(['status' => false, 'message' => "Invalid Chat ID",], 400);
            }
            return response()->json(['status' => true, 'message' => "", 'data' => $getChatDetails], 200);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => "Exception Error: " . $e->getMessage(),], 400);
        }
    }


    /**
     * Display a listing chatList.
     *
     * @return \Illuminate\Http\Response
     */
    public function chatList(Request $request)
    {
        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        if ($user) {
            $userExisted = $request['id'] = $user->tokenable_id;
            // $entryLogin = User::whereId($uID)->first();
        }

        try {
            if ($request->has('smart_searching')) {
                $searching = $request->smart_searching;
                $chatListDetails = chat::where('massage', 'LIKE', '%' . $searching . '%')
                    ->where(function ($query) use ($userExisted) {
                        $query->where('chats.senderId', '=', $userExisted)
                            ->orWhere('chats.receiverId', '=', $userExisted);
                    })
                    ->join('users', 'chats.senderId', '=', 'users.id')
                    ->join('users as ru', 'chats.receiverId', '=', 'ru.id')
                    ->join('partner_details', 'chats.senderId', '=', 'partner_details.coupleId')
                    ->join('partner_details as pd', 'chats.receiverId', '=', 'pd.coupleId')
                    ->select(
                        'chats.*',
                        'users.id as senderId',
                        'users.userName as senderName',
                        'users.profileImage as senderProfilePic',
                        'ru.id as receiverId',
                        'ru.userName as receiverName',
                        'ru.profileImage as receiverProfilePic',
                        'partner_details.id as partnerId',
                        'partner_details.coupleName as partnerName',
                        'partner_details.profileImage as partnerProfileImage',
                        'pd.id as partnerId',
                        'pd.coupleName as partnerName',
                        'pd.profileImage as partnerProfileImage',
                    )
                    ->get();
            } else {
                $chatListDetails = chat::where(function ($query) use ($userExisted) {
                    $query->where('chats.senderId', '=', $userExisted)
                        ->orWhere('chats.receiverId', '=', $userExisted);
                })
                    ->join('users', 'chats.senderId', '=', 'users.id')
                    ->join('users as ru', 'chats.receiverId', '=', 'ru.id')
                    ->join('partner_details', 'chats.senderId', '=', 'partner_details.coupleId')
                    ->join('partner_details as pd', 'chats.receiverId', '=', 'pd.coupleId')
                    ->select(
                        'chats.*',
                        'users.id as senderId',
                        'users.userName as senderName',
                        'users.profileImage as senderProfilePic',
                        'ru.id as receiverId',
                        'ru.userName as receiverName',
                        'ru.profileImage as receiverProfilePic',
                        'partner_details.id as senderpartnerId',
                        'partner_details.coupleName as senderpartnerName',
                        'partner_details.profileImage as senderpartnerProfileImage',
                        'pd.id as receiverpartnerId',
                        'pd.coupleName as receiverpartnerName',
                        'pd.profileImage as receiverpartnerProfileImage',
                    )
                    ->get();
            }

            // Filter the results based on whether $userExisted matches with senderId or receiverId
            $filteredChatList = [];
            foreach ($chatListDetails as $chat) {
                if ($userExisted != $chat->senderId) {
                    $filteredChatList[] = [
                        'id' => $chat->id,
                        'senderId' => $chat->senderId,
                        'senderName' => $chat->senderName,
                        'senderProfilePic' => $chat->senderProfilePic,
                        'partnerId' => $chat->senderpartnerId,
                        'partnerName' => $chat->senderpartnerName,
                        'partnerPic' => $chat->senderpartnerProfileImage,
                    ];
                } elseif ($userExisted != $chat->receiverId) {
                    $filteredChatList[] = [
                        'id' => $chat->id,
                        'receiverId' => $chat->receiverId,
                        'receiverName' => $chat->receiverName,
                        'receiverProfilePic' => $chat->receiverProfilePic,
                        'partnerId' => $chat->receiverpartnerId,
                        'partnerName' => $chat->receiverpartnerName,
                        'partnerPic' => $chat->receiverpartnerProfileImage,
                    ];
                }
            }

            return response()->json(['success' => true, 'data' => $filteredChatList], 200);
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
        try {
            DB::beginTransaction();
            $input = $request->all();
            $validator = Validator::make($input, [
                'chatId' => 'bail|required|exists:chats,id',
                'message' => 'required_if:messageType,text',
                'fileObject' => 'required_if:messageType,image,video',
                'senderImage' => 'required',
                'messageType' => [
                    'bail',
                    'required',
                    function ($attribute, $value, $fail) {
                        $allowedTypes = ['text', 'image', 'video'];
                        if (!in_array($value, $allowedTypes)) {
                            $fail($attribute . ' is invalid.');
                        }
                    },
                ],
            ]);
            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => $validator->errors()->first(),], 400);
            }
            // dd($input);
            if ($request->fileObject) {
                $image = $request->file('fileObject');
                $imageName = 'image-' . time() . rand(1, 1000) . '.' . $image->extension();
                $image->move(public_path('UploadImages'), $imageName);
                $img = env('APP_URL') . "/UploadImages/" . $imageName;
                $input['fileUrl'] = $img;
            }
            $input['senderId'] = auth()->id();
            $getMessage = message::create($input);
            // Send Notification
            $this->sendNotification($request, $getMessage);
            DB::commit();
            return response()->json(['status' => true, 'message' => "Message sent successfully.", 'data' => $getMessage], 200);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => "Exception Error: " . $e->getMessage(),], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        chat::findOrFail($id)->delete();
        return response()->json(['status' => true, 'message' => "Chat has been deleted successfully."], 200);
    }

    // Send Push / FCM Notification & Save Notification in our system
    private function sendNotification(Request $request, $getMessage)
    {
        // Save Notification Details
        $getReceiverUser = $getMessage->chat->senderId == auth()->id() ? $getMessage->chat->receiver : $getMessage->chat->sender;
        $notificationMessage = auth()->user()->userName . " sents you a message.";
        $getNotification = UserNotification::saveNotification([
            'senderId' => auth()->id(),
            'receiverId' => $getReceiverUser->id,
            'chatId' => $request->chatId,
            'body' => $request->message ?? "Sents you a file.",
            'type' => "chat"
        ]);
        // Send FCM Notification
        if (count($getReceiverUser->deviceTokens)) {
            $user = auth()->user();
            $senderDetail = [
                'id' => $user->id,
                'userName' => $user->userName,
                'title' => $user->title,
                'coupleName' => $user->coupleName,
                'profileImage' => $user->profileImage,
            ];
            foreach ($getReceiverUser->deviceTokens as $deviceToken) {
                $notificationData = [
                    'notificationId' => $getNotification->id,
                    'senderId' => auth()->id(),
                    'receiverId' => $getReceiverUser->friendId,
                    'chatId' => $request->chatId,
                    'senderDetails' => $senderDetail,
                    'type' => "chat",
                ];
                UserNotification::sendNotification($deviceToken->token, $notificationMessage, $notificationData);
            }
        }
    }
}
