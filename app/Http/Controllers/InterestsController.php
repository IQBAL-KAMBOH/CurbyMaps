<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Interests;
use App\Models\AllInterests;
use Illuminate\Support\Facades\DB;

class InterestsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $dataFetch = Interests::where('userId', auth()->id())
                ->with('user', 'interest') // Change 'allInterest' to 'interest'
                ->get();

            $dataFetch = $dataFetch->map(function ($dataFetch) {
                return [
                    'id' => $dataFetch->id,
                    'userId' => $dataFetch->userId,
                    'userName' => $dataFetch->user->userName,
                    'interestId' => $dataFetch->interestId,
                    'interestName' => $dataFetch->interest->interest, // Change 'allInterest' to 'interest'
                    'created_at' => $dataFetch->created_at,
                    'updated_at' => $dataFetch->updated_at,
                ];
            });

            return response()->json(['success' => true, 'users_interest' => $dataFetch], 200);
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
            $request->validate([
                "interestId"    =>  "required|array|max:5"
            ]);

            DB::beginTransaction();
            foreach ($request->interestId as $interest) {
                Interests::create([
                    "userId" => auth()->id(),
                    "interestId" => $interest
                ]);
            }
            DB::commit();
            return response()->json(['success' => true, 'message' => "interest added successfully"], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
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
            $InterestsData['userId'] = $user->tokenable_id;
            // $entryLogin = User::whereId($uID)->first();
        }
        try {

            $updateData = $request->all();
            $isUpdate  = Interests::where("id", $id)
                ->where("userId", $InterestsData)
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

            $isDelete  = Interests::where("id", $id)->delete();

            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Admin add Interests.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeAdminInterest(Request $request)
    {
        $request->validate([

            "interest"    =>  "required|unique:all_interests"

        ]);

        try {

            $allInterestData = [

                "interest"   => $request->interest,

            ];

            $id = AllInterests::insertGetId($allInterestData);

            return response()->json(['success' => true, 'data' => ["id" => $id], 'message' => "interest added successfully"], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Admin fetch Interests
     *
     * @return \Illuminate\Http\Response
     */
    public function fetchAdminInterests(Request $request)
    {
        try {
            if ($request->has('smart_searching')) {
                $searching = $request->smart_searching;
                $Category = AllInterests::where('interest', 'LIKE', '%' . $searching . '%')
                    ->paginate(20);
            } else {
                $Category = AllInterests::paginate(20);
            }

            return response()->json(['success' => true, 'all_interest' =>  $Category], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Admin Update Interests.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function UpdateAdminInterest(Request $request, $id)
    {
        try {

            $updateData = $request->all();
            $isUpdate  = AllInterests::where("id", $id)->update($updateData);

            // return $this->successResponse(["is_update" => $isUpdate ],"success",200);

            return response()->json(['success' => true, 'is_update' =>  $isUpdate], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Admin delete Interests.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyAdminInterest($id)
    {
        try {

            $isDelete  = AllInterests::where("id", $id)->delete();

            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
}
