<?php

namespace Database\Seeders;

use App\Models\AllInterests;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InterestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $interests = [
            ['interest' => 'Travel'],
            ['interest' => 'Movies'],
            ['interest' => 'Art'],
            ['interest' => 'Guiter'],
            ['interest' => 'Technology'],
            ['interest' => 'Swimming'],
            ['interest' => 'Snooker'],
            ['interest' => 'Cooking'],
            ['interest' => 'Shopping'],
            ['interest' => 'Music'],
            ['interest' => 'Pets']
        ];

        foreach ($interests as $interest) {
            AllInterests::create($interest);
        }
    }
}
