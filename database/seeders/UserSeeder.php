<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i=1; $i <= 20 ; $i++) { 
            User::query()->create([
                'name' => fake()->name,
                'email' => fake()->unique()->email,
                'password' => fake()->password,
            ]);
        }
    }
}
