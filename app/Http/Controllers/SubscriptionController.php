<?php

namespace App\Http\Controllers;

use App\Models\Subscription;
use Illuminate\Http\Request;
use Stripe\Stripe;

class SubscriptionController extends Controller
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
                $fetchData = Subscription::where('Name', 'LIKE', '%' . $searching . '%')
                    ->paginate(10);
            } else {
                $fetchData = Subscription::paginate(20);
            }

            return response()->json(['success' => true, 'all_subscription' =>  $fetchData], 200);
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
            "Name"    => "required",
            "price"   => "required",
            "details" => "required"
        ]);

        try {
            Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
            $product = \Stripe\Product::create([
                'name' => $request->Name,
                'type' => 'service', // or 'good' for physical goods
                'description' => $request->details,
            ]);

            // Create a price for the product (recurring on a monthly basis)
            $price = \Stripe\Price::create([
                'product' => $product->id,
                'unit_amount' => $request->price * 100,
                'currency' => 'usd',
                'recurring' => [
                    'interval' => 'month',
                ],
            ]);
            $SubscriptionData = [
                "Name"    => $request->Name,
                "price"   => $request->price,
                "details" => $request->details,
                "planId"  => $price->id,
                "productId"  => $product->id,
            ];
            $subscription = Subscription::create($SubscriptionData);

            return response()->json(['success' => true, 'message' => "Subscription added successfully", 'data' => $subscription], 200);
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
            $request->validate([
                "Name"    => "required",
                "price"   => "required",
                "details" => "required"
            ]);
            $updateData = $request->input();
            $subscription = Subscription::find($id);
            Stripe::setApiKey(env('STRIPE_SECRET_KEY'));

            $product = \Stripe\Product::update($subscription->productId, [
                'name' => $request->Name,
                'description' => $request->details,
            ]);
            // // Create a new price object with the updated unit amount
            $price = \Stripe\Price::create([
                'unit_amount' => (float) $request->price * 100, // unit amount in cents
                'currency' => 'usd',
                'product' => $product->id,
                'recurring' => [
                    'interval' => 'month',
                ],
            ]);
            $updateData['productId'] = $product->id;
            $updateData['planId'] = $price->id;
            $isUpdate  = $subscription->update($updateData);

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
            $isDelete  = Subscription::where("id", $id)->delete();
            return response()->json(['success' => true, 'is_delete' =>  $isDelete], 200);
        } catch (\Throwable $exception) {
            return response()->json(['success' => false, 'data' => [], 'message' => $exception->getMessage()], 500);
        }
    }
}
