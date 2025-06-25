<?php

namespace App\Http\Controllers;

use App\Models\FrequentLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class FrequentLocationController extends Controller
{
    public function index()
    {
        $locations = FrequentLocation::where('user_id', Auth::id())->get();
        return response()->json(['isSuccessful' => true, 'data' => $locations]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'label' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'latitude' => 'nullable|string',
            'longitude' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()->first()], 400);
        }

        $location = FrequentLocation::create([
            'user_id' => Auth::id(),
            'label' => $request->label,
            'address' => $request->address,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
        ]);

        return response()->json(['isSuccessful' => true, 'message' => 'Location added successfully', 'data' => $location], 201);
    }


    // Add this method to get a single location's details
    public function show(FrequentLocation $frequentLocation)
    {
        // Ensure the user can only see their own locations
        if ($frequentLocation->user_id !== Auth::id()) {
            return response()->json(['isSuccessful' => false, 'message' => 'Unauthorized'], 403);
        }
        return response()->json(['isSuccessful' => true, 'data' => $frequentLocation]);
    }

    // Add this method to update an existing location
    public function update(Request $request, FrequentLocation $frequentLocation)
    {
        // Ensure the user can only update their own locations

        if ($frequentLocation->user_id !== Auth::id()) {
            return response()->json(['isSuccessful' => false, 'message' => 'Unauthorized'], 403);
        }

        $validator = Validator::make($request->all(), [
            'label' => 'sometimes|required|string|max:255',
            'address' => 'sometimes|required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()->first()], 400);
        }

        $frequentLocation->update($request->only(['label', 'address']));

        return response()->json(['isSuccessful' => true, 'message' => 'Location updated successfully', 'data' => $frequentLocation]);
    }

    // Add this method to delete a location
    public function destroy(FrequentLocation $frequentLocation)
    {
        // Ensure the user can only delete their own locations
        if ($frequentLocation->user_id !== Auth::id()) {
            return response()->json(['isSuccessful' => false, 'message' => 'Unauthorized'], 403);
        }

        $frequentLocation->delete();

        return response()->json(['isSuccessful' => true, 'message' => 'Location deleted successfully']);
    }
}