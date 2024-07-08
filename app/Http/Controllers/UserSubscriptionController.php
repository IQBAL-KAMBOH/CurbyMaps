<?php

namespace App\Http\Controllers;

use App\Models\Subscription;
use App\Models\UserSubscription;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Stripe\Stripe;

class UserSubscriptionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            "subscriptionId" => "required",
            "stripeToken" => "required", // Make sure stripeToken is required
        ]);

        try {
            // Find subscription using subscriptionId instead of id
            $subscription = Subscription::find($request->subscriptionId);
            if (!$subscription) {
                throw new \Exception("Subscription not found.");
            }

            Stripe::setApiKey(env('STRIPE_SECRET_KEY'));

            // Create a payment method using Stripe.js and tokenization
            $paymentMethod = \Stripe\PaymentMethod::create([
                'type' => 'card',
                'card' => [
                    'token' => $request->stripeToken, // Assuming you pass the token from the client
                ],
            ]);

            // Attach the payment method to the customer
            $customer = \Stripe\Customer::create([
                'payment_method' => $paymentMethod->id, // Attach payment method to customer
                'invoice_settings' => [
                    'default_payment_method' => $paymentMethod->id,
                ],
            ]);

            // Create a new subscription
            $stripeSubscription = \Stripe\Subscription::create([
                'customer' => $customer->id,
                'items' => [
                    ['price' => $subscription->planId], // Plan ID from Stripe
                ],
            ]);

            $userSubscription = [
                'subscriptionId' => $subscription->id,
                'userId' => auth()->id(),
                'receiptData' => json_encode($stripeSubscription),
                'expiryDate' => Carbon::now()->addDays(30)
            ];

            $userSubscription = UserSubscription::create($userSubscription);

            return response()->json([
                'success' => true,
                'message' => 'User subscription purchased successfully.',
                'data' => $userSubscription
            ], 200);
        } catch (\Throwable $exception) {
            return response()->json([
                'success' => false,
                'data' => [],
                'message' => $exception->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\UserSubscription  $userSubscription
     * @return \Illuminate\Http\Response
     */
    public function show(UserSubscription $userSubscription)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\UserSubscription  $userSubscription
     * @return \Illuminate\Http\Response
     */
    public function edit(UserSubscription $userSubscription)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserSubscription  $userSubscription
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserSubscription $userSubscription)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UserSubscription  $userSubscription
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserSubscription $userSubscription)
    {
        //
    }
}
