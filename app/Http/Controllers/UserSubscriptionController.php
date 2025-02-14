<?php

namespace App\Http\Controllers;

use App\Models\Subscription;
use App\Models\UserSubscription;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Http;

class UserSubscriptionController extends Controller
{


    public function store(Request $request)
    {
        $request->validate([
            "subscriptionId" => "required",
        ]);

        try {
            $subscription = Subscription::find($request->subscriptionId);
            if (!$subscription) {
                throw new \Exception("Subscription not found.");
            }

            $user = auth()->user(); // Get the authenticated user

            // Get PayPal access token
            $paypalAuth = Http::withBasicAuth(env('PAYPAL_CLIENT_ID'), env('PAYPAL_SECRET'))
                ->asForm()
                ->post('https://api-m.sandbox.paypal.com/v1/oauth2/token', [
                    'grant_type' => 'client_credentials',
                ]);

            if ($paypalAuth->failed()) {
                throw new \Exception("PayPal authentication failed.");
            }

            $accessToken = $paypalAuth->json('access_token');

            // Create PayPal order
            $orderData = [
                'intent' => 'CAPTURE',
                'purchase_units' => [
                    [
                        'amount' => [
                            'currency_code' => 'USD',
                            'value' => $subscription->price,
                        ],
                        'description' => "Subscription Plan: " . $subscription->planId,
                        'custom_id' => $user->id, // Store user ID for tracking
                        'invoice_id' => 'INV-' . strtoupper(uniqid()), // Unique invoice ID
                    ],
                ],
                'application_context' => [
                    'return_url' => env('APP_URL') . "/api/paypal/success?subscriptionId={$request->subscriptionId}",
                    'cancel_url' => env('APP_URL') . "/api/paypal/cancel",
                ],
            ];

            $paypalOrder = Http::withToken($accessToken)
                ->post('https://api-m.sandbox.paypal.com/v2/checkout/orders', $orderData);

            if ($paypalOrder->failed()) {
                throw new \Exception("Failed to create PayPal order.");
            }

            $order = $paypalOrder->json();

            return response()->json([
                'success' => true,
                'message' => 'Redirect to PayPal for payment approval.',
                'approval_url' => collect($order['links'])->where('rel', 'approve')->first()['href'],
            ], 200);
        } catch (\Throwable $exception) {
            return response()->json([
                'success' => false,
                'data' => [],
                'message' => $exception->getMessage(),
            ], 500);
        }
    }


    public function paypalSuccess(Request $request)
    {

        try {
            $paypalAuth = Http::withBasicAuth(env('PAYPAL_CLIENT_ID'), env('PAYPAL_SECRET'))
                ->asForm()
                ->post('https://api-m.sandbox.paypal.com/v1/oauth2/token', [
                    'grant_type' => 'client_credentials',
                ]);

            if ($paypalAuth->failed()) {
                throw new \Exception("PayPal authentication failed.");
            }

            $accessToken = $paypalAuth->json('access_token');

            // Capture payment
            $capture = Http::withToken($accessToken)
                ->post("https://api-m.sandbox.paypal.com/v2/checkout/orders/{$request->query('token')}/capture");

            if ($capture->failed()) {
                throw new \Exception("Failed to capture PayPal payment.");
            }

            $paypalResponse = $capture->json();

            $userSubscription = UserSubscription::create([
                'subscriptionId' => $request->query('subscriptionId'),
                'userId' => auth()->id(),
                'receiptData' => json_encode($paypalResponse),
                'expiryDate' => Carbon::now()->addDays(30),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Subscription successful!',
                'data' => $userSubscription,
            ], 200);
        } catch (\Throwable $exception) {
            return response()->json([
                'success' => false,
                'message' => $exception->getMessage(),
            ], 500);
        }
    }

    public function paypalCancel()
    {
        return response()->json([
            'success' => false,
            'message' => 'Payment cancelled.',
        ], 400);
    }
}
