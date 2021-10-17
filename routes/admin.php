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
