<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        $startTime = microtime(true);

        for ($i=1; $i <= 100; $i++) { 
            $data[] = [
                'name' => fake()->unique()->text(10),
                'created_at' => now(),
                'updated_at' => now()
            ];
            $data1[] = [
                'name'  => fake()->name(),
                'category_id' => rand(90,100),
                'price'  => rand(10000,10000000),
                'quantity'  => rand(0,10000),
                'image'  => fake()->imageUrl(),
                'created_at' => now(),
                'updated_at' => now()
            ];

            if($i % 100 == 0){
                Category::query()->insert($data);
                Product::query()->insert($data1);
            }

            echo 'Thêm mới bản ghi số: '. $i . PHP_EOL;
        }
        $this->call([
            UserSeeder::class,
            CartSeeder::class,
            CartItemSeeder::class,
        ]);

        $endTime = microtime(true);
        echo 'Thời gian thực hiện: '.($endTime - $startTime);
    }
}
