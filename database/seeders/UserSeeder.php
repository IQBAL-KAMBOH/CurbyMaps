<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            ['userRole' => 1, 'full_name' => 'Stephan de Vries','email' => 'admin@yopmail.com', 'password' => bcrypt('admin123')],
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
