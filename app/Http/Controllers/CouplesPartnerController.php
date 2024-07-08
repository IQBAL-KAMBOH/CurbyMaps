<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\partnerDetails;
use DB;

class CouplesPartnerController extends Controller
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
            $userExisted = $request['coupleId'] = $user->tokenable_id;
        }
    
        try {
            $fetchPartner = partnerDetails::where('partner_details.coupleId', $userExisted)
                ->join('users', 'partner_details.coupleId', '=', 'users.id')
                ->select('partner_details.id as partnerId', 'partner_details.coupleId as coupleId', 'partner_details.coupleName as partner_name',
                    'partner_details.age as age', 'partner_details.gender as gender', 'partner_details.height as height',
                    'partner_details.dob as date_of_birth', 'partner_details.profileImage as profileImage', 'users.id as couplesId', 'users.coupleCategories  as couplecategories',
                    'users.userName as couple_name', 'users.title as title', 'users.emailAddress as coupleEmail', 'users.coupleName as coupleName', 'users.age as coupleage',
                    'users.gender as couple_gender', 'users.height as couple_height', 'users.dob as coupledob', 'users.bio as couplebio', 'users.profileImage as coupleImage')
                ->get();
    
            // Create the response array with the desired structure
            $responseArray = [
                'success' => true,
                    'partner_details' => [
                        'partnerId' => $fetchPartner[0]->partnerId,
                        'coupleId' => $fetchPartner[0]->coupleId,
                        'partner_name' => $fetchPartner[0]->partner_name,
                        'age' => $fetchPartner[0]->age,
                        'gender' => $fetchPartner[0]->gender,
                        'height' => $fetchPartner[0]->height,
                        'date_of_birth' => $fetchPartner[0]->date_of_birth,
                        'profileImage' => $fetchPartner[0]->profileImage,
                    ],
                    'couple_details' => [
                        'couplesId' => $fetchPartner[0]->couplesId,
                        'couplecategories ' => $fetchPartner[0]->couplecategories,
                        'couple_name' => $fetchPartner[0]->couple_name,
                        'title' => $fetchPartner[0]->title,
                        'coupleEmail' => $fetchPartner[0]->coupleEmail,
                        'coupleName' => $fetchPartner[0]->coupleName,
                        'coupleage' => $fetchPartner[0]->coupleage,
                        'couple_gender' => $fetchPartner[0]->couple_gender,
                        'couple_height' => $fetchPartner[0]->couple_height,
                        'coupledob' => $fetchPartner[0]->coupledob,
                        'couplebio' => $fetchPartner[0]->couplebio,
                        'coupleImage' => $fetchPartner[0]->coupleImage,
                    ],
            
            ];
    
            return response()->json($responseArray, 200);
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

            "coupleName" => "required",
            "age" => "required",
            "gender" => "required",
            "height" => "required",
            "dob" => "required",
            "profileImage" => "required|image",


        ]);

        try {

            $partnerData = [

                "coupleId" => $request->coupleId,
                "coupleName" => $request->coupleName,
                "age" => $request->age,
                "gender" => $request->gender,
                "height" => $request->height,
                "dob" => $request->dob,

            ];


            $userAuth = $request->header('Authorization');
            // Explode the string by the pipe character
            $parts = explode('|', $userAuth);
            // Get the part after the pipe
            $afterPipe = isset($parts[1]) ? $parts[1] : null;
            $hashedToken = hash('sha256', $afterPipe);
            $user = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
            if ($user) {
                $partnerData['coupleId'] = $user->tokenable_id;
                // $entryLogin = User::whereId($uID)->first();
            }

            if ($user) {
                $partnerData['coupleId'] = $user->tokenable_id;

                // Check if a partner with this coupleId already exists
                $existingPartner = partnerDetails::where('coupleId', $partnerData['coupleId'])
                    ->join('users', 'partner_details.coupleId', '=', 'users.id')
                    ->select('partner_details.*', 'users.id as userId', 'users.userName as register_name')
                    ->first();

                if ($existingPartner) {
                    // Partner already exists, return existing data
                    return response()->json([
                        'success' => true,
                        'data' => $existingPartner,
                        'message' => 'Partner already exists',
                    ], 200);
                }
            }

            $file = $request->has('profileImage');
            $img = "";

            if ($file) {
                $image = $request->file('profileImage');
                $imageName = 'image-' . time() . rand(1, 1000) . '.' . $image->extension();
                $img = env('APP_URL') . "/PartnerImages/" . $imageName;
                $image->move(public_path('PartnerImages'), $imageName);

                $partnerData['profileImage'] = $img;
            }

            $id = partnerDetails::insertGetId($partnerData);

            return response()->json(['success' => true, 'data' => ["id" => $id], 'message' => "partner added successfully"], 200);
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
        if($user){
        $InterestsData['coupleId'] = $user->tokenable_id;
        // $entryLogin = User::whereId($uID)->first();
        }
        try { 

            $updateData = $request->all();
            $isUpdate  = partnerDetails::where("id", $id)
            ->where("coupleId", $InterestsData)
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
    public function destroy($id)
    {
        try { 
   
            $isDelete  = partnerDetails::where("id", $id)->delete();

            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);

        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
}
