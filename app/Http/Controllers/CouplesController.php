<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CoupleCategories;

class CouplesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            if($request->has('smart_searching')) {
                $searching = $request->smart_searching;
                $Category = CoupleCategories::where('categorieName','LIKE','%'.$searching.'%')
                ->paginate(20);
            }
            else {
                $Category = CoupleCategories::paginate(20);
            }
          
            return response()->json(['success' => true, 'couples_category' =>  $Category], 200);
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

            "categorieName" => "required",

        ]);

        try {
            $categorieData = [

                "categorieName" => $request->categorieName,
                
            ];
            
            $id = CoupleCategories::insertGetId($categorieData);

            return response()->json(['success' => true, 'data' => ["id" => $id], 'message' => "Category added successfully"], 200);
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
        try { 

            $updateData = $request->all();
            $isUpdate  = CoupleCategories::where("id", $id)->update($updateData);
  
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
   
            $isDelete  = CoupleCategories::where("id", $id)->delete();

            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);

        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
}
