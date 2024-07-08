<?php

namespace Database\Seeders;

use App\Models\CoupleCategories;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CoupleCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $coupleCategories = [
            ['categorieName' => 'Travelers'],
            ['categorieName' => 'Coffee'],
            ['categorieName' => 'Drive'],
            ['categorieName' => 'Hangout'],
        ];

        foreach ($coupleCategories as $coupleCategory) {
            CoupleCategories::create($coupleCategory);
        }
    }
}
