<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::get('logout', [AuthController::class,'logout'])->middleware('auth:sanctum');
Route::middleware(['auth:sanctum','check.role.api'])->group(function () {
    Route::apiResource('categories', CategoryController::class);
    Route::get('categories/{category}/products', [CategoryController::class, 'products'])->name('categories.products');
    Route::apiResource('products', ProductController::class);
});
