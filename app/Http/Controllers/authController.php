<?php

namespace App\Http\Controllers;

use App\Models\DeviceToken;
use App\Models\partnerDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\UserOtp;
use App\Models\UserPhoneVerification;
use App\Models\userRole;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Twilio\Rest\Client;
use Illuminate\Support\Facades\Log;

// use DateTime;


class authController extends Controller
{

    /**
     * valodator function .
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    function validator(Request $request)
    {

        $validator = Validator::make($request->all(), [
            // 'email' => 'required',
            // 'firstName' => 'required',
            // 'lastName' => 'required',
            // 'email' => 'required|email',
            // 'password' => 'required',
            // 'phoneNumber' => 'required',

        ]);
        if ($validator->fails()) {
            $messages = $validator->messages()->all();
            return response()->json([
                'error' => 'Validation failed',
                'message' => $messages,
            ], 400);
        }
        return null;
    }

    private function saveImage($image, $folderName)
    {
        $imageName = 'image-' . time() . rand(1, 1000) . '.' . $image->extension();
        $img = env('APP_URL') . "/$folderName/" . $imageName;
        $image->move(public_path($folderName), $imageName);
        return $img;
    }


    /**
     * register user .
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'full_name' => 'required',
                'email' => 'required|unique:users',
                'password' => 'required',
                'PhoneNo' => 'required',
                'city' => 'required',
                'post_code' => 'required',
                'car_number' => 'required',
                'car_model' => 'required',
            ]
        );
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            return response()->json([
                'error' => 'Validation failed',
                'message' => $messages,
            ], 400);
        }
        $input = $request->all();
        $userData = [
            "userRole" => $input['userRole'] ?? 2,
            "full_name" => $input['full_name'],
            "email" => $input['email'],
            "password" => bcrypt($input['password']),
            "PhoneNo" => $input['PhoneNo'],
            "city" => $input['city'],
            "post_code" => $input['post_code'],
            "car_number" => $input['car_number'],
            "car_model" => $input['car_model'],
        ];

        try {
            DB::beginTransaction();
            $user = User::create($userData);
            $emailotp = $this->sendOTP($user->email);
            $phoneotp = $this->sendOTPPhone($user->PhoneNo);

            $response = [
                'isSuccessful' => true,
                'message' => 'Registration successful. Please verify your phone number with the OTP=' . $phoneotp . ' we sent. And Email  with the OTP=' . $emailotp,
            ];
            DB::commit();
            return response()->json($response, 200);
        } catch (\Exception $e) {
            $response = [
                'isSuccessful' => false,
                'message' => $e->getMessage(),
            ];
            return response()->json($response, 400);
        }
    }
    public function verifyRegisterOTP(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'phone_number' => 'required|exists:users,PhoneNo',
                'otp' => 'required'
            ]
        );
        if ($validator->fails()) {
            return response()->json(['status' => 'Validation failed', 'message' => $validator->errors()->first(),], 400);
        }
        $user = User::where('PhoneNo', $request->phone_number)->first();
        if ($user) {
            $getDetails = UserPhoneVerification::where(['phone_number' => $request->phone_number, 'otp' => $request->otp])->first();
            if (!$getDetails) {
                return response()->json(['status' => false, 'message' => "Invalid OTP Code"], 400);
            }
            $getDetails->delete();
            $token = $user->createToken('Curby Maps')->plainTextToken;

            $response = [
                'isSuccessful' => true,
                'access_token' => "Bearer " . $token,
                'user' => $user,
            ];
            return response()->json($response, 200);
        } else {
            return response()->json(['status' => false, 'message' => "User Not Found"], 401);
        }
    }

    /**
     * login user .
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $request->merge(['userRole' => $request->userRole ?? 2]);

        if (in_array($request->social_login, [1, 2])) {
            $userByEmail = User::where('email', $request->email)->first();

            if ($userByEmail) {
                // Only update device token if user exists
                $userByEmail->update(['device_token' => $request->device_token]);
            } else {
                // Create new user with only basic fields
                $userByEmail = User::create([
                    'email' => $request->email,
                    'password' => bcrypt($request->email), // Temporary default
                    'device_token' => $request->device_token,
                    'userRole' => 2,
                ]);
            }

            // Authenticate user and generate token
            Auth::login($userByEmail);
            $token = $userByEmail->createToken('Curby Maps')->plainTextToken;

            // Save device token (only for social_login == 2)
            if ($request->social_login == 2) {
                DeviceToken::updateOrCreate(
                    ['userId' => $userByEmail->id],
                    ['token' => $request->device_token]
                );
            }

            return response()->json([
                'isSuccessful' => true,
                'access_token' => 'Bearer ' . $token,
                'user' => $userByEmail,
            ], 200);
        }

        // Normal email/password login
        if (Auth::attempt($request->only(['userRole', 'email', 'password']))) {
            $user = Auth::user();

            if ($user->status != 1) {
                Log::info('Authentication Failed - User not active');
                return response()->json([
                    'isSuccessful' => false,
                    'message' => 'User not active',
                ], 401);
            }

            $user->update(['device_token' => $request->device_token]);

            DeviceToken::updateOrCreate(
                ['userId' => $user->id],
                ['token' => $request->device_token]
            );

            $token = $user->createToken('Curby Maps')->plainTextToken;

            return response()->json([
                'isSuccessful' => true,
                'access_token' => 'Bearer ' . $token,
                'user' => $user,
            ], 200);
        }

        return response()->json([
            'isSuccessful' => false,
            'message' => 'Incorrect Credentials',
        ], 401);
    }

    public function handle(Request $request)
    {
        $response = [
            'isSuccessFul' => false,
            'message' => 'Handling unknown request: ' . env("APP_URL") . "/" . $request->path(),
        ];
        // Your logic to handle unknown requests goes here
        return response()->json($response, 400);
    }



    public function userLogout(Request $request)
    {
        DeviceToken::where('token', $request->deviceToken)->delete();
        $request->user()->tokens()->delete();
        return response()->json([
            'message' => 'Logout successful',
        ]);
    }


    // This method is used for send Twilio Message
    private function sendMessage($message, $recipients)
    {
        // dd($recipients);
        $account_sid = getenv("TWILIO_SID");
        $auth_token = getenv("TWILIO_AUTH_TOKEN");
        $twilio_number = getenv("TWILIO_NUMBER");
        $client = new Client($account_sid, $auth_token);
        $client->messages->create($recipients, ['from' => $twilio_number, 'body' => $message]);
    }

    // This method is used for send OTP and Resend OTP
    public static function sendOTP($vildateemail)
    {

        $otp = 2222;
        $otp = rand(1000, 9999);

        UserOtp::updateOrCreate([
            'email' => $vildateemail
        ], [
            'otp' => $otp
        ]);
        return $otp;
    }
    public static function sendOTPPhone($phone)
    {

        $otp = 2222;
        $otp = rand(1000, 9999);
        // ******Send OTP through Twilio Service when the service is available
        $message = "Your OTP is $otp. Please use this code to complete the verification process";
        // $this->sendMessage($message, $phone);
        UserPhoneVerification::updateOrCreate([
            'phone_number' => $phone
        ], [
            'otp' => $otp
        ]);
        return $otp;
    }

    // This method is used to Verify OTP
    public function verifyOTP(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'email' => 'required|exists:users,email',
                'otp' => 'required'
            ]
        );
        if ($validator->fails()) {
            return response()->json(['status' => 'Validation failed', 'message' => $validator->errors()->first(),], 400);
        }
        $getDetails = UserOtp::where(['email' => $request->email, 'otp' => $request->otp])->first();
        if (!$getDetails) {
            return response()->json(['status' => false, 'message' => "Invalid OTP Code"], 400);
        }
        $getDetails->delete();
        $user = User::where('email', $request->email)->first();
        $token = $user->createToken('Curby Maps')->plainTextToken;
        $success = [
            'isSuccessful' => true,
            'access_token' => "Bearer " . $token,
            'user' => $user,
        ];

        return response()->json(['success' => true, 'data' => $success, 'message' => 'Verify OTP successfully.'], 200);
    }
    public function getProfile(Request $request)
    {
        // 1. Get the currently authenticated user instance.
        $user = Auth::user();

        // 2. Efficiently load the counts of the relationships onto the user object.
        // This adds `followers_count`, `following_count`, and `posts_count`
        // properties to the $user object without loading all the data.
        $user->loadCount(['followers', 'following', 'posts']);

        // 3. Return the response. The $user object now contains the counts.
        return response()->json([
            'isSuccessful' => true,
            'user' => $user,
        ], 200);
    }


    public function updateProfile(Request $request)
    {
        $user = Auth::user();

        $validator = Validator::make($request->all(), [
            'full_name'   => 'sometimes|required|string',
            'language'    => 'sometimes|required|string',
            'car_number'  => 'sometimes|required|string',
            'car_model'   => 'sometimes|required|string',
            'profileImage' => 'sometimes|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()->first()], 400);
        }

        $data = $request->all();

        // Handle profile image upload
        if ($request->hasFile('profileImage')) {
            $image = $request->file('profileImage');
            $imagePath = $image->store('profileImages', 'public'); // stores relative path

            // Delete old image if it exists
            if ($user->profileImage) {
                $oldPath = str_replace(asset('storage') . '/', '', $user->profileImage);
                // Storage::disk('public')->delete($oldPath);
            }

            // Save full URL in the database
            $data['profileImage'] = asset('storage/' . $imagePath);
        }


        $user->update($data);

        return response()->json([
            'isSuccessful' => true,
            'message' => 'Profile updated successfully.',
            'user' => $user
        ], 200);
    }
}
