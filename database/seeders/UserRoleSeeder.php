<?php

namespace Database\Seeders;

use App\Models\userRole;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $userRoles = [
            ['userRole' => 'admin'],
            ['userRole' => 'user'],
        ];

        foreach ($userRoles as $role) {
            UserRole::create($role);
        }
    }
}
