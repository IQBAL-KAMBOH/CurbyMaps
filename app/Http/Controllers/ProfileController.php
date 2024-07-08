<?php

namespace App\Http\Controllers;

use App\Models\DeviceTokon;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;
use Hash;


class ProfileController extends Controller
{

    //change password
    public function changePassword(Request $request)
    {
        try {
            $request->validate([
                'password' => 'required|confirmed|min:8',
            ]);

            $user = Auth::user();

            // Check if the old password is provided and matches
            if ($request->filled('oldPassword')) {
                if (!Hash::check($request->oldPassword, $user->password)) {
                    return response()->json([
                        'success' => false,
                        'data' => [],
                        'message' => 'Old password is incorrect'
                    ], 400);
                }
            }

            // Update the password
            $user->update([
                'password' => Hash::make($request->password),
            ]);

            return response()->json([
                'success' => true,
                'data' => [],
                'message' => 'Password changed successfully'
            ], 200);
        } catch (\Throwable $exception) {
            return response()->json([
                'success' => false,
                'data' => [],
                'message' => $exception->getMessage()
            ], 500);
        }
    }

    //forgetting password
    public function forgetPassword(Request $request)
    {
        try {
            // Phone number verification
            $user = User::where('PhoneNo', $request->PhoneNo)->first();
        
            if (!$user) {
                return response()->json([
                    'success' => false,
                    'data' => [],
                    'message' => 'User not found with this phone number'
                ], 404);
            }
        
            // Now validate the new password
            $request->validate([
                'password' => 'required|confirmed|min:8',
            ]);
            $user = Auth::user();
            // Update the password
            $user->update([
                'password' => Hash::make($request->password),
            ]);
        
            // Delete associated device tokens
            DeviceTokon::where('token', $request->deviceToken)->delete();
            $user->tokens()->delete();
        
            return response()->json([
                'success' => true,
                'data' => [],
                'message' => 'Password changed successfully'
            ], 200);
        } catch (\Throwable $exception) {
            return response()->json([
                'success' => false,
                'data' => [],
                'message' => $exception->getMessage()
            ], 500);
        }
    }
}
