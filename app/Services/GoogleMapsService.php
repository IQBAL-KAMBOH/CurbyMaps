<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class GoogleMapsService
{
    protected $apiKey;
    protected $placesBaseUrl = 'https://maps.googleapis.com/maps/api/place';

    public function __construct()
    {
        $this->apiKey = config('services.google_maps.api_key');
        if (!$this->apiKey) {
            Log::critical('Google Maps API Key is not configured.');
            // In a real app, you might throw an exception here
        }
    }

    /**
     * Find places using Google Places API Nearby Search.
     *
     * @param float $latitude
     * @param float $longitude
     * @param int $radius Radius in meters
     * @param string $type e.g., 'parking'
     * @param string|null $keyword
     * @return array|null The JSON decoded response from Google or null on failure.
     */
    public function findNearbyPlaces(float $latitude, float $longitude, int $radius, string $type = 'parking', ?string $keyword = null): ?array
    {
        if (!$this->apiKey) {
            return null;
        }

        $params = [
            'location' => "{$latitude},{$longitude}",
            'radius' => $radius,
            'type' => $type,
            'key' => $this->apiKey,
        ];

        if ($keyword) {
            $params['keyword'] = $keyword;
        }

        $response = Http::timeout(10)->get("{$this->placesBaseUrl}/nearbysearch/json", $params); // Added timeout

        if ($response->successful()) {
            $data = $response->json();
            // Log::info('Google Places API Response:', $data); // For debugging
            return $data;
        }

        Log::error('Google Places API Nearby Search error: ', [
            'status' => $response->status(),
            'body' => $response->body(),
            'url' => "{$this->placesBaseUrl}/nearbysearch/json",
            'params' => $params // Be careful logging params if they contain sensitive info (not the case here)
        ]);
        return null;
    }

    /**
     * Get details for a specific place using its Place ID.
     * Useful for getting more info like phone number, website, detailed opening hours.
     *
     * @param string $placeId
     * @param array $fields e.g. ['name', 'formatted_address', 'opening_hours', 'website']
     * @return array|null
     */
    public function getPlaceDetails(string $placeId, array $fields = []): ?array
    {
        if (!$this->apiKey) return null;

        $params = [
            'place_id' => $placeId,
            'key' => $this->apiKey,
        ];

        if (!empty($fields)) {
            $params['fields'] = implode(',', $fields); // e.g., "name,rating,formatted_phone_number"
        } else {
            // Request a good set of default fields if none specified
            $params['fields'] = 'place_id,name,formatted_address,geometry,icon,rating,user_ratings_total,opening_hours,photos,vicinity,business_status,types';
        }


        $response = Http::timeout(10)->get("{$this->placesBaseUrl}/details/json", $params);

        if ($response->successful() && isset($response->json()['result'])) {
            return $response->json()['result'];
        }

        Log::error('Google Place Details API error: ', [
            'status' => $response->status(),
            'body' => $response->body(),
            'place_id' => $placeId
        ]);
        return null;
    }
}