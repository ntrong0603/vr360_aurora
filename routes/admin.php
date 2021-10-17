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
        return view('admin.dashboard.index');
    });
    Route::group(['prefix' => 'setting'], function () {
        Route::get('/', [App\Http\Controllers\SettingController::class, 'index'])->name('setting.index');
        Route::post('/', [App\Http\Controllers\SettingController::class, 'index'])->name('setting.edit');
    });
    Route::group(['prefix' => 'country'], function () {
        Route::get('/', [App\Http\Controllers\CountryController::class, 'index'])->name('country.index');
        Route::get('/create', [App\Http\Controllers\CountryController::class, 'create'])->name('country.create');
        Route::post('/store', [App\Http\Controllers\CountryController::class, 'store'])->name('country.store');
        Route::get('/edit/{country}', [App\Http\Controllers\CountryController::class, 'edit'])->name('country.edit');
        Route::post('/update/{country}', [App\Http\Controllers\CountryController::class, 'update'])->name('country.update');
        Route::delete('/delete/{country}', [App\Http\Controllers\CountryController::class, 'destroy'])->name('country.delete');
    });
    Route::group(['prefix' => 'business'], function () {
        Route::get('/', [App\Http\Controllers\BusinessController::class, 'index'])->name('business.index');
        Route::get('/create', [App\Http\Controllers\BusinessController::class, 'create'])->name('business.create');
        Route::post('/store', [App\Http\Controllers\BusinessController::class, 'store'])->name('business.store');
        Route::get('/edit/{business}', [App\Http\Controllers\BusinessController::class, 'edit'])->name('business.edit');
        Route::post('/update/{business}', [App\Http\Controllers\BusinessController::class, 'update'])->name('business.update');
        Route::delete('/delete/{business}', [App\Http\Controllers\BusinessController::class, 'destroy'])->name('business.delete');
    });
    Route::group(['prefix' => 'utilities'], function () {
        Route::get('/', [App\Http\Controllers\UtilitiesController::class, 'index'])->name('utilities.index');
        Route::get('/create', [App\Http\Controllers\UtilitiesController::class, 'create'])->name('utilities.create');
        Route::post('/store', [App\Http\Controllers\UtilitiesController::class, 'store'])->name('utilities.store');
        Route::get('/edit/{utilities}', [App\Http\Controllers\UtilitiesController::class, 'edit'])->name('utilities.edit');
        Route::post('/update/{utilities}', [App\Http\Controllers\UtilitiesController::class, 'update'])->name('utilities.update');
        Route::delete('/delete/{utilities}', [App\Http\Controllers\UtilitiesController::class, 'destroy'])->name('utilities.delete');
    });
    Route::group(['prefix' => 'reservation'], function () {
        Route::get('/', [App\Http\Controllers\ReservationController::class, 'index'])->name('reservation.index');
        Route::get('/edit/{reservation}', [App\Http\Controllers\ReservationController::class, 'edit'])->name('reservation.edit');
        Route::delete('/delete/{reservation}', [App\Http\Controllers\ReservationController::class, 'destroy'])
            ->name('reservation.delete');
    });
    Route::group(['prefix' => 'contact'], function () {
        Route::get('/', [App\Http\Controllers\ContactController::class, 'index'])->name('contact.index');
        Route::delete('/delete/{contact}', [App\Http\Controllers\ContactController::class, 'destroy'])
            ->name('contact.delete');
    });
    Route::group(['prefix' => 'user'], function () {
        Route::get('/', [App\Http\Controllers\UserController::class, 'index'])->name('user.index');
        Route::get('/create', [App\Http\Controllers\UserController::class, 'create'])->name('user.create');
        Route::post('/store', [App\Http\Controllers\UserController::class, 'store'])->name('user.store');
        Route::get('/edit/{user}', [App\Http\Controllers\UserController::class, 'edit'])->name('user.edit');
        Route::post('/update/{user}', [App\Http\Controllers\UserController::class, 'update'])->name('user.update');
        Route::delete('/delete/{user}', [App\Http\Controllers\UserController::class, 'destroy'])
            ->name('user.delete');
    });
    Route::group(['prefix' => 'language'], function () {
        Route::get('/', [App\Http\Controllers\LanguageController::class, 'index'])->name('language.index');
        Route::get('/create', [App\Http\Controllers\LanguageController::class, 'create'])->name('language.create');
        Route::post('/store', [App\Http\Controllers\LanguageController::class, 'store'])->name('language.store');
        Route::get('/edit/{language}', [App\Http\Controllers\LanguageController::class, 'edit'])->name('language.edit');
        Route::post('/update/{language}', [App\Http\Controllers\LanguageController::class, 'update'])->name('language.update');
        Route::delete('/delete/{language}', [App\Http\Controllers\LanguageController::class, 'destroy'])
            ->name('language.delete');
    });
});
