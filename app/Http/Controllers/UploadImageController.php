<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UploadImage;
use DB;

class UploadImageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
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
            // if ($request->has('user_id')) {
            //     $user_id = $request->user_id;
            $Profile = UploadImage::where('upload_images.userId', $userExisted)
                ->join('users', 'upload_images.userId', '=', 'users.id')
                ->select('upload_images.*', 'users.id as userId', 'users.userName as user_name')
                ->get();

            // } else {
            //     return response()->json(['success' => false, 'data' => [], 'message' => 'User not found'], 404);
            // }

            return response()->json(['success' => true, 'upload Images' => $Profile], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * userId againts data get.
     *
     * @return \Illuminate\Http\Response
     */
    public function usersImage(Request $request)
    {

        try {
            if ($request->has('userId')) {
                $user_id = $request->userId;
                $Profile = UploadImage::where('upload_images.userId', $user_id)
                    ->join('users', 'upload_images.userId', '=', 'users.id')
                    ->select('upload_images.*', 'users.id as userId', 'users.userName as user_name')
                    ->get();
            } else {
                return response()->json(['success' => false, 'data' => [], 'message' => 'User not found'], 404);
            }

            return response()->json(['success' => true, 'upload Images' => $Profile], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([

            "Image"     =>  "required",

        ]);

        try {

            $galleryData = [

                "userId"           => $request->userId,

            ];

            $userAuth = $request->header('Authorization');
            // Explode the string by the pipe character
            $parts = explode('|', $userAuth);

            // Get the part after the pipe
            $afterPipe = isset($parts[1]) ? $parts[1] : null;
            $hashedToken = hash('sha256', $afterPipe);
            $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
            if ($user) {
                $galleryData['userId'] = $user->tokenable_id;
                // $entryLogin = User::whereId($uID)->first();
            }

            $file = $request->has('Image');
            $img = "";

            if ($file) {
                $image = $request->file('Image');
                // foreach($request->file('profileImage') as $image){
                $imageName = 'image-' . time() . rand(1, 1000) . '.' . $image->extension();
                $img = env('APP_URL') . "/UploadImages/" . $imageName;
                $image->move(public_path('UploadImages'), $imageName);
                // }
                $galleryData['Image'] = $img;
            }

            $id = UploadImage::insertGetId($galleryData);

            return response()->json(['success' => true, 'data' => ["id" => $id], 'message' => "Image Upload successfully"], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        if ($user) {
            $userData['userId'] = $user->tokenable_id;
            // $entryLogin = User::whereId($uID)->first();
        }
        try {

            $updateData = $request->all();
            $isUpdate  = UploadImage::where("id", $id)
                ->where("userId", $userData)
                ->update($updateData);

            // return $this->successResponse(["is_update" => $isUpdate ],"success",200);

            return response()->json(['success' => true, 'is_update' =>  $isUpdate], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        $userAuth = $request->header('Authorization');
        // Explode the string by the pipe character
        $parts = explode('|', $userAuth);

        // Get the part after the pipe
        $afterPipe = isset($parts[1]) ? $parts[1] : null;
        $hashedToken = hash('sha256', $afterPipe);
        $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        if ($user) {
            $userData['userId'] = $user->tokenable_id;
            // $entryLogin = User::whereId($uID)->first();
        }
        try {

            $isDelete  = UploadImage::where("id", $id)
                ->where("userId", $userData)
                ->delete();

            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
}
