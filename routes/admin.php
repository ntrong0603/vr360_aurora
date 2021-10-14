<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/
// Login
Route::get('/login', [LoginController::class, 'showAdminLoginForm'])->middleware('guest:admin');
Route::post('/login', [LoginController::class, 'adminLogin'])->name('admin.login');
Route::get('/logout', [LoginController::class, 'adminLogout'])->name('admin.logout');
// End Login

Route::group(['middleware' => ['auth:admin', 'role:admin']], function () {
    Route::get('/', function () {
        return view('admin.layout');
    });
});
