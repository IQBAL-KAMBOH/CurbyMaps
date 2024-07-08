<?php

namespace App\Http\Controllers;

use App\Models\DeviceTokon;
use App\Models\partnerDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\UserPhoneVerification;
use App\Models\userRole;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Twilio\Rest\Client;

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
            // 'userName' => 'required',
            // 'firstName' => 'required',
            // 'lastName' => 'required',
            // 'emailAddress' => 'required|email',
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
                'userRole'                     => 'required|exists:user_roles,id',
                'userName'                     => 'required',
                'emailAddress'                 => 'required|unique:users',
                'password'                     => 'required',
                'PhoneNo'                      => 'required',
                'details.coupleCategories'     => 'required|exists:couple_categories,id',
                'details.title'                => 'required',
                'details.coupleName'           => 'required',
                'details.age'                  => 'required',
                'details.gender'               => 'required',
                'details.height'               => 'required',
                'details.dob'                  => 'required',
                'details.bio'                  => 'required',
                'details.profileImage'         => 'required|file',
                'partner_details.coupleName'   => 'required',
                'partner_details.age'          => 'required',
                'partner_details.gender'       => 'required',
                'partner_details.height'       => 'required',
                'partner_details.dob'          => 'required',
                'partner_details.profileImage' => 'required|file'
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
        // dd($input['details']['coupleCategories']);
        $userData = [

            "userRole"            => $input['userRole'],
            "userName"            => $input['userName'],
            "emailAddress"        => $input['emailAddress'],
            "password"            => bcrypt($input['password']),
            "PhoneNo"             => $input['PhoneNo'],
            "coupleCategories"    => $input['details']['coupleCategories'],
            "title"               => $input['details']['title'],
            "coupleName"          => $input['details']['coupleName'],
            "age"                 => $input['details']['age'],
            "gender"              => $input['details']['gender'],
            "height"              => $input['details']['height'],
            "dob"                 => $input['details']['dob'],
            "bio"                 => $input['details']['bio'],
            "profileImage"        => isset($input['details']['profileImage']) ? $this->saveImage($input['details']['profileImage'], 'user_profile') : ""

        ];

        try {
            // Check that the userRole exists before creating the user
            DB::beginTransaction();
            $user = User::create($userData);
            $partnerData = [
                "coupleId"     => $user->id,
                "coupleName"   => $input['partner_details']['coupleName'],
                "age"          => $input['partner_details']['age'],
                "gender"       => $input['partner_details']['gender'],
                "height"       => $input['partner_details']['height'],
                "dob"          => $input['partner_details']['dob'],
                "profileImage" => isset($input['partner_details']['profileImage']) ? $this->saveImage($input['partner_details']['profileImage'], 'partnerImage') : ""

            ];
            $partner = partnerDetails::create($partnerData);
            $token = $user->createToken('Couple Konnects')->plainTextToken;
            $user['partner'] = $partner;
            $response = [
                'isSuccessful' => true,
                'access_token' => "Bearer " . $token,
                'user' => $user,
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

  /**
     * login user .
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        \Log::info('Login Attempt:', $request->all());
        $request->merge(['userRole' => $request->userRole ?? 2]);
        $request->merge(['emailAddress' => $request->userName]);

        if (Auth::attempt($request->only(['userRole', 'emailAddress', 'password']))) {
            $user = Auth::user();

            // Check if the user is active

            if ($user->status == 1) {
                \Log::info('Authentication Successful');

                $user->update(['device_token' => $request->device_token]);

                $user = User::where('emailAddress', $user->emailAddress)->with(['partner', 'userInterest', 'subsription'])->first();

                $token = $user->createToken('Couple Konnects')->plainTextToken;
                DeviceTokon::create([
                    'userId' => $user->id,
                    'token' => $request->device_token,
                ]);
                $success = [
                    'isSuccessful' => true,
                    'access_token' => "Bearer " . $token,
                    'user' => $user,
                ];
                $response = [
                    'data' => $success,
                    'message' => 'Login Successfully'
                ];

                return response()->json($success, 200);
            } else {
                \Log::info('Authentication Failed - User not active');
                $response = [
                    'isSuccessFul' => false,
                    'message' => 'User not active',
                ];
                return response()->json($response, 401);
            }
        } else {
            \Log::info('Authentication Failed');
            $response = [
                'isSuccessFul' => false,
                'message' => 'Incorrect Credentials',
            ];
            return response()->json($response, 401);
        }
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
    /**
     * login user update .
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function editUser(Request $request)
    {

        $validator = Validator::make(
            $request->all(),
            [
                // 'userRole'                     => 'required|exists:user_roles,id',
                'userName'                     => 'required',
                // 'emailAddress'                 => 'required|unique:users',
                // 'password'                     => 'required',
                // 'PhoneNo'                      => 'required',
                'interest'                      => 'required',
                'details.coupleCategories'     => 'required|exists:couple_categories,id',
                'details.title'                => 'required',
                'details.coupleName'           => 'required',
                'details.age'                  => 'required',
                'details.gender'               => 'required',
                'details.height'               => 'required',
                'details.dob'                  => 'required',
                'details.bio'                  => 'required',
                // 'details.profileImage'         => 'file',
                'partner_details.coupleName'   => 'required',
                'partner_details.age'          => 'required',
                'partner_details.gender'       => 'required',
                'partner_details.height'       => 'required',
                'partner_details.dob'          => 'required',
                // 'partner_details.profileImage' => 'file'
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
        // dd($input['details']['coupleCategories']);
        $userData = [

            // "userRole"            => $input['userRole'],
            "userName"            => $input['userName'],
            // "emailAddress"        => $input['emailAddress'],
            // "password"            => bcrypt($input['password']),
            // "PhoneNo"             => $input['PhoneNo'],
            "coupleCategories"    => $input['details']['coupleCategories'],
            "title"               => $input['details']['title'],
            "coupleName"          => $input['details']['coupleName'],
            "age"                 => $input['details']['age'],
            "gender"              => $input['details']['gender'],
            "height"              => $input['details']['height'],
            "dob"                 => $input['details']['dob'],
            "bio"                 => $input['details']['bio'],
        ];
        if (isset($input['details']['profileImage'])) {
            $userData['profileImage'] = $this->saveImage($input['details']['profileImage'], 'user_profile');
        }

        try {
            // Check that the userRole exists before creating the user
            DB::beginTransaction();
            // $user = User::create($userData);
            auth()->user()->update($userData);
            $user = auth()->user();
            $partnerData = [
                // "coupleId"     => $user->id,
                "coupleName"   => $input['partner_details']['coupleName'],
                "age"          => $input['partner_details']['age'],
                "gender"       => $input['partner_details']['gender'],
                "height"       => $input['partner_details']['height'],
                "dob"          => $input['partner_details']['dob'],

            ];
            if (isset($input['partner_details']['profileImage'])) {
                $partnerData['profileImage'] = $this->saveImage($input['partner_details']['profileImage'], 'partnerImage');
            }
            $partner = auth()->user()->partner;
            $partner->update($partnerData);
            auth()->user()->userInterest()->delete();
            // var_dump(json_decode($input['interest'], true));
            // exit;
            foreach (json_decode($input['interest']) as $key => $value) {
                $interest[$key] = [
                    "interestId" => $value,
                ];
            }
            auth()->user()->userInterest()->createMany($interest);
            // $token = $user->createToken('Couple Konnects')->plainTextToken;
            $user['partner'] = $partner;
            $user['user_interest'] = auth()->user()->userInterest;
            $user['subsription'] = auth()->user()->subsription;
            $response = [
                'isSuccessful' => true,
                // 'access_token' => "Bearer " . $token,
                'user' => $user,
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

    /**
     * all users fetch this api
     *
     * @return \Illuminate\Http\Response
     */
    public function allUser(Request $request)
    {

        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

        try {
            if ($user) {
                $authenticatedUserId = $user->tokenable_id;

                $user = User::where('id', '!=', $authenticatedUserId)
                    ->with(['partner', 'userInterest', 'subsription'])
                    ->get();
            }

            return response()->json(['isSuccessful' => true, 'all_users' => $user], 200);
        } catch (\Throwable $exception) {
            return response()->json(['isSuccessful' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**

     * Display a listing admin login info
     *
     * @return \Illuminate\Http\Response
     */
    public function adminInfo(Request $request)
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

            $Profile = User::where('id', '=', $userExisted)
                ->where('users.userRole', 1)
                ->get();


            return response()->json(['success' => true, 'admin_info' => $Profile], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

  
     * Fetch User Subsription plan this api
     *
     * @return \Illuminate\Http\Response
     */
    public function FetchUserSubsription(Request $request)
    {
        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

        try {
            if ($user) {
                $authenticatedUserId = $user->tokenable_id;

                $user = User::where('id', '=', $authenticatedUserId)
                    ->with(['partner', 'userInterest', 'subsription'])
                    ->get();
            }

            return response()->json(['isSuccessful' => true, 'user' => $user], 200);
        } catch (\Throwable $exception) {
            return response()->json(['isSuccessful' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
    //fetch all register Active users

    public function fetchActiveUsers(Request $request)
    {
        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

        try {

            $authenticatedUserId = $user->tokenable_id;
            $searchTerm = $request->smart_searching;

            // Check if userId and isAprovel are present in the request
            if ($request->has('userId')) {
                $userId = $request->input('userId');
                $isAprovelValue = $request->input('isActives', '');

                if ($isAprovelValue === 'active') {
                    // Update the isActives and isAprovel fields to 1 and set the status message for accept
                    User::where('id', $userId)->update(['status' => 1]);
                } elseif ($isAprovelValue === 'inactive') {
                    // Update the isAprovel field to 0 and set the status message for reject
                    User::where('id', $userId)->update(['status' => 0]);
                }

                $allUsers = User::where('id', '!=', $authenticatedUserId)
                    ->with(['partner', 'userInterest', 'subsription'])
                    ->where('userName', 'LIKE', '%' . $searchTerm . '%')
                    ->where('users.userRole', 2)
                    ->paginate(20);
            } else {
                $allUsers = User::where('id', '!=', $authenticatedUserId)
                    ->with(['partner', 'userInterest', 'subsription'])
                    ->where('users.userRole', 2)
                    ->paginate(20);
            }

            return response()->json(['success' => true, 'all_users' =>  $allUsers], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage()], 500);
        }
    }

    public function getUsersInRadius(Request $request)
    {
        $request->validate([
            'Latitude' => 'required',
            'Longitude' => 'required',
        ]);

        try {

            $lat = $request->input('Latitude');
            $lon = $request->input('Longitude');


            $users = User::select(
                "users.*",
                DB::raw("6371 * acos(cos(radians(" . $lat . ")) 
                        * cos(radians(users.Latitude)) 
                        * cos(radians(users.Longitude) - radians(" . $lon . ")) 
                        + sin(radians(" . $lat . ")) 
                        * sin(radians(users.Latitude))) AS distance")
            )
                ->where("Latitude", '!=', null)
                ->where('id', '!=', auth()->id())
                ->orderBy('distance')
                ->paginate(20);

            // Convert the collection to the desired format
            $formattedData = [];
            foreach ($users as $user) {
                $partnerData = null;
                if ($user->partner) {
                    $partnerData = [
                        'id' => $user->partner->id,
                        'coupleId' => $user->partner->coupleId,
                        'coupleName' => $user->partner->coupleName,
                        'age' => $user->partner->age,
                        'gender' => $user->partner->gender,
                        'height' => $user->partner->height,
                        'dob' => $user->partner->dob,
                        'profileImage' => $user->partner->profileImage,
                    ];
                }

                $userInterestData = null;
                if ($user->userInterest) {
                    $userInterestData = $user->userInterest->map(function ($interest) {
                        return [
                            'id' => $interest->id,
                            'userId' => $interest->userId,
                            'interestId' => $interest->interestId,
                            'interest' => [
                                'id' => $interest->interest->id,
                                'interest' => $interest->interest->interest,
                            ],
                        ];
                    });
                }

                $formattedData[] = [
                    'id' => $user->id,
                    'userRole' => $user->userRole,
                    'coupleCategories' => $user->coupleCategories,
                    'userName' => $user->userName,
                    'title' => $user->title,
                    'emailAddress' => $user->emailAddress,
                    'coupleName' => $user->coupleName,
                    'age' => $user->age,
                    'PhoneNo' => $user->PhoneNo,
                    'gender' => $user->gender,
                    'height' => $user->height,
                    'dob' => $user->dob,
                    'bio' => $user->bio,
                    'profileImage' => $user->profileImage,
                    'Latitude' => $user->Latitude,
                    'Longitude' => $user->Longitude,
                    'status' => $user->status,
                    'partner' => $partnerData,
                    'user_interest' => $userInterestData,
                ];
            }

            return response()->json(['success' => true, 'users' =>  $users], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    // private function getLoggedInUser(Request $request)
    // {
    //     $userAuth = $request->header('Authorization');
    //     // Explode the string by the pipe character
    //     $parts = explode('|', $userAuth);

    //     // Get the part after the pipe
    //     $afterPipe = isset($parts[1]) ? $parts[1] : null;
    //     $hashedToken = hash('sha256', $afterPipe);
    //     // Assuming user_id is stored in the token, adjust this query according to your database schema
    //     return DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
    // }

    // private function haversine($lat1, $lon1, $lat2, $lon2)
    // {
    //     $R = 6371.0; // Radius of the Earth in kilometers
    //     $dlat = deg2rad($lat2 - $lat1);
    //     $dlon = deg2rad($lon2 - $lon1);
    //     $a = sin($dlat / 2) * sin($dlat / 2) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin($dlon / 2) * sin($dlon / 2);
    //     $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
    //     $distance = $R * $c;
    //     return $distance;
    // }



    // public function fetchAllUsers(Request $request)
    // {
    //     $userAuth = $request->header('Authorization');
    //     // Explode the string by the pipe character
    //     $parts = explode('|', $userAuth);

    //     // Get the part after the pipe
    //     $afterPipe = isset($parts[1]) ? $parts[1] : null;
    //     $hashedToken = hash('sha256', $afterPipe);
    //     $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

    //     try {

    //         $authenticatedUserId = $user->tokenable_id;
    //         $searchTerm = $request->smart_searching;

    //         // Check if userId and isAprovel are present in the request
    //         if ($request->has('userId')) {
    //             $userId = $request->input('userId');
    //             $isAprovelValue = $request->input('isActives', '');

    //             if ($isAprovelValue === 'active') {
    //                 // Update the isActives and isAprovel fields to 1 and set the status message for accept
    //                 User::where('id', $userId)->update(['isActives' => 1]);
    //             } elseif ($isAprovelValue === 'inactive') {
    //                 // Update the isAprovel field to 0 and set the status message for reject
    //                 User::where('id', $userId)->update(['isActives' => 0]);
    //             }

    //             $allUsers = User::where('userName', 'LIKE', '%' . $searchTerm . '%')
    //                 ->where('users.userRole', 2)
    //                 ->where('id', '!=', $authenticatedUserId)
    //                 ->paginate(10);
    //         } else {
    //             $allUsers = User::where('users.userRole', 2)
    //                 ->where('id', '!=', $authenticatedUserId)
    //                 ->paginate(10);
    //         }

    //         return response()->json(['success' => true, 'all_users' =>  $allUsers], 200);
    //     } catch (\Throwable $exception) {
    //         return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
    //     }
    // }


    //  //fetch all register Active users

    // public function fetchActiveUsers(Request $request)
    // {
    //     $userAuth = $request->header('Authorization');
    //     // Explode the string by the pipe character
    //     $parts = explode('|', $userAuth);

    //     // Get the part after the pipe
    //     $afterPipe = isset($parts[1]) ? $parts[1] : null;
    //     $hashedToken = hash('sha256', $afterPipe);
    //     $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

    //     try {

    //         $authenticatedUserId = $user->tokenable_id;
    //         $searchTerm = $request->smart_searching;

    //         // Check if userId and isAprovel are present in the request
    //         if ($request->has('userId')) {
    //             $userId = $request->input('userId');
    //             $isAprovelValue = $request->input('isActives', '');

    //             if ($isAprovelValue === 'active') {
    //                 // Update the isActives and isAprovel fields to 1 and set the status message for accept
    //                 User::where('id', $userId)->update(['isActives' => 1]);
    //             } elseif ($isAprovelValue === 'inactive') {
    //                 // Update the isAprovel field to 0 and set the status message for reject
    //                 User::where('id', $userId)->update(['isActives' => 0]);
    //             }

    //             $allUsers = User::where('userName', 'LIKE', '%' . $searchTerm . '%')
    //                 ->where('users.userRole', 2)
    //                 ->where('users.isActives', 1) // Add the condition for isActive
    //                 ->where('id', '!=', $authenticatedUserId)
    //                 ->paginate(10);
    //         } else {
    //             $allUsers = User::where('users.userRole', 2)
    //                 ->where('users.isActives', 1) // Add the condition for isActive
    //                 ->where('id', '!=', $authenticatedUserId)
    //                 ->paginate(10);
    //         }

    //         return response()->json(['success' => true, 'active_users' =>  $allUsers], 200);
    //     } catch (\Throwable $exception) {
    //         return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
    //     }
    // }

    // //fetch all register Inactive users

    // public function fetchInactiveUsers(Request $request)
    // {
    //     $userAuth = $request->header('Authorization');
    //     // Explode the string by the pipe character
    //     $parts = explode('|', $userAuth);

    //     // Get the part after the pipe
    //     $afterPipe = isset($parts[1]) ? $parts[1] : null;
    //     $hashedToken = hash('sha256', $afterPipe);
    //     $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

    //     try {

    //         $authenticatedUserId = $user->tokenable_id;
    //         $searchTerm = $request->smart_searching;

    //         // Check if userId and isAprovel are present in the request
    //         if ($request->has('userId')) {
    //             $userId = $request->input('userId');
    //             $isAprovelValue = $request->input('isActives', '');

    //             if ($isAprovelValue === 'active') {
    //                 // Update the isActives and isAprovel fields to 1 and set the status message for accept
    //                 User::where('id', $userId)->update(['isActives' => 1]);
    //             } elseif ($isAprovelValue === 'inactive') {
    //                 // Update the isAprovel field to 0 and set the status message for reject
    //                 User::where('id', $userId)->update(['isActives' => 0]);
    //             }

    //             $allUsers = User::where('userName', 'LIKE', '%' . $searchTerm . '%')
    //                 ->where('users.userRole', 2)
    //                 ->where('users.isActives', 0) // Add the condition for isActive
    //                 ->where('id', '!=', $authenticatedUserId)
    //                 ->paginate(10);
    //         } else {
    //             $allUsers = User::where('users.userRole', 2)
    //                 ->where('users.isActives', 0) // Add the condition for isActive
    //                 ->where('id', '!=', $authenticatedUserId)
    //                 ->paginate(10);
    //         }

    //         return response()->json(['success' => true, 'active_users' =>  $allUsers], 200);
    //     } catch (\Throwable $exception) {
    //         return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
    //     }
    // }
    /**
     * fatch Users By Category this api.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * @param categoryId
     */
    public function fatchUsersByCategory(Request $request)
    {

        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();

        try {
            // Retrieve the "categoryId" value from the request
            $doctorCategory = $request->input('categoryId');

            if ($user) {
                $authenticatedUserId = $user->tokenable_id;
                $users = User::join('couple_categories', 'users.coupleCategories', '=', 'couple_categories.id')
                    ->where('users.coupleCategories', $doctorCategory) // Filter by doctorCategories
                    ->where('users.status', 1) // Filter by isActive = 1
                    ->where('users.id', '!=', $authenticatedUserId)
                    ->select(
                        'users.*',
                        'couple_categories.categorieName as CategoryName'
                    )
                    ->get();

                if ($users->isEmpty()) {
                    return response()->json(['isSuccessful' => true, 'user' => [], 'message' => 'Not Found Category Users.'], 200);
                }

                $userRoles = UserRole::pluck('userRole', 'id');

                $users = $users->map(function ($user) use ($userRoles) {
                    $user->userRoleName = $userRoles[$user->userRole];
                    return $user;
                });
            }

            // Convert the collection to the desired format
            $formattedUserData = [];
            foreach ($users as $user) {
                $partnerData = null;
                if ($user->partner) {
                    $partnerData = [
                        'id' => $user->partner->id,
                        'coupleId' => $user->partner->coupleId,
                        'coupleName' => $user->partner->coupleName,
                        'age' => $user->partner->age,
                        'gender' => $user->partner->gender,
                        'height' => $user->partner->height,
                        'dob' => $user->partner->dob,
                        'profileImage' => $user->partner->profileImage,
                    ];
                }

                $userInterestData = null;
                if ($user->userInterest) {
                    $userInterestData = $user->userInterest->map(function ($interest) {
                        return [
                            'id' => $interest->id,
                            'userId' => $interest->userId,
                            'interestId' => $interest->interestId,
                            'interest' => [
                                'id' => $interest->interest->id,
                                'interest' => $interest->interest->interest,
                            ],
                        ];
                    });
                }

                $formattedUserData[] = [
                    'id' => $user->id,
                    'userRole' => $user->userRole,
                    'coupleCategories' => $user->coupleCategories,
                    'userName' => $user->userName,
                    'title' => $user->title,
                    'emailAddress' => $user->emailAddress,
                    'coupleName' => $user->coupleName,
                    'age' => $user->age,
                    'PhoneNo' => $user->PhoneNo,
                    'gender' => $user->gender,
                    'height' => $user->height,
                    'dob' => $user->dob,
                    'bio' => $user->bio,
                    'profileImage' => $user->profileImage,
                    'status' => $user->status,
                    'partner' => $partnerData,
                    'user_interest' => $userInterestData,
                ];
            }

            return response()->json(['isSuccessful' => true, 'users' => $formattedUserData], 200);
        } catch (\Throwable $exception) {
            return response()->json(['isSuccessful' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
    //user logout api
    public function userLogout(Request $request)
    {
        DeviceTokon::where('token', $request->deviceToken)->delete();
        $request->user()->tokens()->delete();
        return response()->json([
            'message' => 'Logout successful',
        ]);
    }

    /**
     * Store a map Longitude and Latitude .
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function mapStore(Request $request)
    {
        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        if ($user) {
            $userExisted = $request['userId'] = $user->tokenable_id;
            // $entryLogin = User::whereId($uID)->first();
        }

        try {

            $mapData = [

                "Latitude" => $request->Latitude,
                "Longitude" => $request->Longitude

            ];
            $data = User::where('id', '=', $userExisted)
                ->update($mapData);


            return response()->json(['success' => true, 'update' => $data], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
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
    public function sendOTP(Request $request)
    {
        $vildatePhone = $request->is_sign_up
            ?   'required|unique:users,PhoneNo'
            :   'required|exists:users,PhoneNo';

        $validator = Validator::make(
            $request->all(),
            [
                'phone_number' => $vildatePhone
            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation failed',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        $otp = 2222;
        // $otp = rand(1000, 9999);
        // ******Send OTP through Twilio Service when the service is available
        // $message = "Your OTP is $otp. Please use this code to complete the verification process for couples Konnect";
        // $this->sendMessage($message, $request->phone_number);
        UserPhoneVerification::updateOrCreate([
            'phone_number' => $request->phone_number,
            'otp' => $otp
        ]);
        return response()->json(['success' => true, 'otp' => $otp, 'message' => 'OTP sent successfully.'], 200);
    }

    // This method is used to Verify OTP
    public function verifyOTP(Request $request)
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
        $getDetails = UserPhoneVerification::where(['phone_number' => $request->phone_number, 'otp' => $request->otp])->first();
        if (!$getDetails) {
            return response()->json(['status' => false, 'message' => "Invalid OTP Code"], 400);
        }
        $getDetails->delete();
        return response()->json(['success' => true, 'data' => [], 'message' => 'Verify OTP successfully.'], 200);
    }
}
