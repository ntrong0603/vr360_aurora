<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [App\Http\Controllers\TourController::class, 'index']);
Route::post('/reservationContact', [App\Http\Controllers\ContactController::class, 'reservationContact'])->name('reservationContact');
Route::post('/contact', [App\Http\Controllers\ContactController::class, 'processContact'])->name('contact');
