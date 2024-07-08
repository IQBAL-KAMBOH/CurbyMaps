<?php

namespace App\Http\Controllers;

use App\Models\FAQ;
use Illuminate\Http\Request;

class FAQController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            if ($request->has('smart_searching')) {
                $searching = $request->smart_searching;
                $fetchFAQ = FAQ::where('faqQuestion', 'LIKE', '%' . $searching . '%')
                    ->paginate(20);
            } else {
                $fetchFAQ = FAQ::paginate(20);
            }

            return response()->json(['success' => true, 'faq' =>  $fetchFAQ], 200);
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
        $request->validate([

            "faqQuestion" => "required",
            "faqAnswer" => "required"

        ]);

        try {
            $faqData = [

                "faqQuestion" => $request->faqQuestion,
                "faqAnswer" => $request->faqAnswer

            ];

            $id = FAQ::create($faqData);

            return response()->json(['success' => true, 'data' => ["id" => $id], 'message' => "FAQ added successfully"], 200);
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
        try {

            $updateData = $request->all();
            $isUpdate  = FAQ::where("id", $id)->update($updateData);

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

            $isDelete  = FAQ::where("id", $id)->delete();

            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
}
