<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashBoardController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('/', [ProductController::class, 'index'])->name('/');

Route::get('/shop-detail/{product}', [ProductController::class, 'shopDetail'])->name('detail');

Route::get('/shop', [ProductController::class, 'shop'])->name('shop');

Route::get('/contact', function () {
    return view('client.contact');
});

Route::middleware('auth')->group(function () {
    Route::get('/cart', [CartController::class, 'cart'])->name('cart');
    Route::post('/add-cart/{product}', [CartController::class, 'addCart'])->name('addCart');
    Route::delete('/cart/destroy/{cartItem}', [CartController::class, 'destroy'])->name('cart.destroy');
    Route::get('/cart/{cartItem}/increase', [CartController::class, 'increaseQuantity'])->name('cart.increase');
    Route::get('/cart/{cartItem}/decrease', [CartController::class, 'decreaseQuantity'])->name('cart.decrease');

    Route::get('/order',[OrderController::class,'index'])->name('checkout');
    Route::post('/store-checkout',[OrderController::class,'store'])->name('store.checkout');
   
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::middleware('check.role')->group(function(){
        Route::prefix('/admin')->group(function () {
            Route::get('', [DashBoardController::class, 'index'])->name('admin');
            Route::resource('categories', CategoryController::class);
            Route::get('categories/{category}/products', [CategoryController::class, 'products'])->name('categories.products');
            Route::resource('products', AdminProductController::class);
            Route::resource('users', UserController::class);
        });
    });
});

require __DIR__ . '/auth.php';
