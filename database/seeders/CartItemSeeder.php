<?php

namespace Database\Seeders;

use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CartItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $carts    = Cart::query()->pluck('id')->all();

        foreach ($carts as $cart) {
            CartItem::create([
                'product_id'=> rand(1,10),
                'cart_id'   => $cart,
                'quantity'  => rand(1,10),
            ]);
        }
    }
}
