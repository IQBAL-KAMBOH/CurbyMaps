<?php

namespace App\Http\Resources;

use Illuminate\Http\Request; // Keep this if you use $request inside the toArray
use Illuminate\Http\Resources\Json\JsonResource;

class GoogleParkingPlaceResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array<string, mixed>
     */
    public function toArray($request): array // Corrected signature from previous error
    {
        $googleApiKey = config('services.google_maps.api_key');
        $photoUrl = null;

        if (isset($this->resource['photos'][0]['photo_reference']) && $googleApiKey) {
            $photoUrl = 'https://maps.googleapis.com/maps/api/place/photo'
                . '?maxwidth=400' // You can make maxwidth configurable if needed
                . '&photoreference=' . $this->resource['photos'][0]['photo_reference']
                . '&key=' . $googleApiKey;
        }

        return [
            // Core fields already present
            'place_id' => $this->resource['place_id'] ?? null,
            'name' => $this->resource['name'] ?? 'N/A',
            'address' => $this->resource['vicinity'] ?? ($this->resource['formatted_address'] ?? 'N/A'),
            'latitude' => $this->resource['geometry']['location']['lat'] ?? null,
            'longitude' => $this->resource['geometry']['location']['lng'] ?? null,
            'rating' => isset($this->resource['rating']) ? (float) $this->resource['rating'] : null,
            'user_ratings_total' => $this->resource['user_ratings_total'] ?? null,
            'icon_url' => $this->resource['icon'] ?? null, // Still useful for map markers if no photo
            'is_open_now' => $this->resource['opening_hours']['open_now'] ?? null,
            'business_status' => $this->resource['business_status'] ?? null,
            'types' => $this->resource['types'] ?? [],
            'source' => 'google_maps',

            // --- Fields specifically requested for the home page ---
            'display_image_url' => $photoUrl, // Constructed photo URL
            'display_name' => $this->resource['name'] ?? 'Unknown Parking', // Same as 'name'
            'display_location' => $this->resource['vicinity'] ?? ($this->resource['formatted_address'] ?? 'No address provided'), // Same as 'address'
            // 'display_price' => '0.00',

            // You might still want to send the raw photos array if the client wants more options or to handle attribution
            'photos_raw_data' => $this->when(isset($this->resource['photos']), function () {
                return collect($this->resource['photos'])->map(function ($photo) {
                    return [
                        'photo_reference' => $photo['photo_reference'],
                        'height' => $photo['height'],
                        'width' => $photo['width'],
                        'html_attributions' => $photo['html_attributions'] ?? [],
                    ];
                })->all();
            }),
        ];
    }
}