<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\GoogleParkingPlaceResource;
use App\Services\GoogleMapsService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;


class ParkingSearchController extends Controller
{
    protected $googleMapsService;

    public function __construct(GoogleMapsService $googleMapsService)
    {
        $this->googleMapsService = $googleMapsService;
    }

    public function searchNearbyGoogle(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
            'radius' => 'sometimes|integer|min:100|max:50000', // Radius in meters
            'keyword' => 'sometimes|string|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $validated = $validator->validated();

        $latitude = (float) $validated['latitude'];
        $longitude = (float) $validated['longitude'];
        $radius = (int) ($validated['radius'] ?? 20000); // Default 20km if not provided
        $keyword = $validated['keyword'] ?? 'parking'; // Default search for 'parking'

        $googleResponse = $this->googleMapsService->findNearbyPlaces(
            $latitude,
            $longitude,
            $radius,
            'parking', // Explicitly searching for type 'parking'
            $keyword
        );

        if (!$googleResponse || $googleResponse['status'] !== 'OK') {
            $errorMessage = 'Failed to fetch parking data from Google Maps API.';
            if (isset($googleResponse['status'])) {
                $errorMessage .= ' Status: ' . $googleResponse['status'];
                if(isset($googleResponse['error_message'])) {
                    $errorMessage .= ' - ' . $googleResponse['error_message'];
                }
            }
            return response()->json(['message' => $errorMessage, 'data' => []], 503);
        }

        // Filter out results that might not actually be parking despite the 'parking' type
        // This is optional, Google's 'parking' type is usually good.
        // $filteredResults = collect($googleResponse['results'])->filter(function ($place) {
        //     return in_array('parking', $place['types'] ?? []);
        // });

        // If you want to fetch details for each place (can be slow and costly):
        // $detailedResults = collect($googleResponse['results'])->map(function ($place) {
        //     if (isset($place['place_id'])) {
        //         $details = $this->googleMapsService->getPlaceDetails($place['place_id']);
        //         return array_merge($place, $details ?? []); // Merge details into original place data
        //     }
        //     return $place;
        // });
        // return GoogleParkingPlaceResource::collection($detailedResults);

        return GoogleParkingPlaceResource::collection(collect($googleResponse['results']));
    }


    public function getPlaceDetails(Request $request, $placeId)
    {
        if (empty($placeId)) {
             return response()->json(['message' => 'Place ID is required.'], 400);
        }

        $fields = $request->input('fields', ''); // e.g. "name,rating,opening_hours"
        $fieldsArray = !empty($fields) ? explode(',', $fields) : [];

        $details = $this->googleMapsService->getPlaceDetails($placeId, $fieldsArray);

        if (!$details) {
            return response()->json(['message' => 'Could not retrieve place details.'], 404);
        }

        // You might want a specific resource for Place Details if the structure is very different
        // For now, we can try to use the same or just return raw
        // return new GoogleParkingPlaceResource((object)$details); // Casting to object for resource
        return response()->json(['data' => $details]);
    }
}