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
    Route::get('/', [App\Http\Controllers\DashboardController::class, 'index']);
    Route::group(['prefix' => 'dashboard'], function () {
        Route::get('/', [App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard.index');
        Route::get('/getDataView', [App\Http\Controllers\DashboardController::class, 'getDataView'])->name('dashboard.getDataView');
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
    Route::group(['prefix' => 'scene'], function () {
        Route::get('/', [App\Http\Controllers\SceneController::class, 'index'])->name('scene.index');
        Route::get('/create', [App\Http\Controllers\SceneController::class, 'create'])->name('scene.create');
        Route::post('/store', [App\Http\Controllers\SceneController::class, 'store'])->name('scene.store');
        Route::get('/edit/{scene}', [App\Http\Controllers\SceneController::class, 'edit'])->name('scene.edit');
        Route::post('/update/{scene}', [App\Http\Controllers\SceneController::class, 'update'])->name('scene.update');
        Route::delete('/delete/{scene}', [App\Http\Controllers\SceneController::class, 'destroy'])->name('scene.delete');
    });
    Route::group(['prefix' => 'visiting'], function () {
        Route::get('/', [App\Http\Controllers\VisitingController::class, 'index'])->name('visiting.index');
        Route::get('/create', [App\Http\Controllers\VisitingController::class, 'create'])->name('visiting.create');
        Route::post('/store', [App\Http\Controllers\VisitingController::class, 'store'])->name('visiting.store');
        Route::get('/edit/{visiting}', [App\Http\Controllers\VisitingController::class, 'edit'])->name('visiting.edit');
        Route::post('/update/{visiting}', [App\Http\Controllers\VisitingController::class, 'update'])->name('visiting.update');
        Route::delete('/delete/{visiting}', [App\Http\Controllers\VisitingController::class, 'destroy'])->name('visiting.delete');
    });
    Route::group(['prefix' => 'land'], function () {
        Route::get('/', [App\Http\Controllers\LandController::class, 'index'])->name('land.index');
        Route::get('/create', [App\Http\Controllers\LandController::class, 'create'])->name('land.create');
        Route::post('/store', [App\Http\Controllers\LandController::class, 'store'])->name('land.store');
        Route::get('/edit/{land}', [App\Http\Controllers\LandController::class, 'edit'])->name('land.edit');
        Route::post('/update/{land}', [App\Http\Controllers\LandController::class, 'update'])->name('land.update');
        Route::delete('/delete/{land}', [App\Http\Controllers\LandController::class, 'destroy'])->name('land.delete');
    });
    Route::group(['prefix' => 'businessStyle'], function () {
        Route::get('/', [App\Http\Controllers\BusinessStyleController::class, 'index'])->name('businessStyle.index');
        Route::get('/create', [App\Http\Controllers\BusinessStyleController::class, 'create'])->name('businessStyle.create');
        Route::post('/store', [App\Http\Controllers\BusinessStyleController::class, 'store'])->name('businessStyle.store');
        Route::get('/edit/{businessStyle}', [App\Http\Controllers\BusinessStyleController::class, 'edit'])->name('businessStyle.edit');
        Route::post('/update/{businessStyle}', [App\Http\Controllers\BusinessStyleController::class, 'update'])->name('businessStyle.update');
        Route::delete('/delete/{businessStyle}', [App\Http\Controllers\BusinessStyleController::class, 'destroy'])->name('businessStyle.delete');
    });
    Route::group(['prefix' => 'landStyle'], function () {
        Route::get('/', [App\Http\Controllers\LandStyleController::class, 'index'])->name('landStyle.index');
        Route::get('/create', [App\Http\Controllers\LandStyleController::class, 'create'])->name('landStyle.create');
        Route::post('/store', [App\Http\Controllers\LandStyleController::class, 'store'])->name('landStyle.store');
        Route::get('/edit/{landStyle}', [App\Http\Controllers\LandStyleController::class, 'edit'])->name('landStyle.edit');
        Route::post('/update/{landStyle}', [App\Http\Controllers\LandStyleController::class, 'update'])->name('landStyle.update');
        Route::delete('/delete/{landStyle}', [App\Http\Controllers\LandStyleController::class, 'destroy'])->name('landStyle.delete');
    });
    Route::group(['prefix' => 'landUse'], function () {
        Route::get('/', [App\Http\Controllers\LandUseController::class, 'index'])->name('landUse.index');
        Route::get('/create', [App\Http\Controllers\LandUseController::class, 'create'])->name('landUse.create');
        Route::post('/store', [App\Http\Controllers\LandUseController::class, 'store'])->name('landUse.store');
        Route::get('/edit/{landUse}', [App\Http\Controllers\LandUseController::class, 'edit'])->name('landUse.edit');
        Route::post('/update/{landUse}', [App\Http\Controllers\LandUseController::class, 'update'])->name('landUse.update');
        Route::delete('/delete/{landUse}', [App\Http\Controllers\LandUseController::class, 'destroy'])->name('landUse.delete');
    });
    Route::group(['prefix' => 'enquiry'], function () {
        Route::get('/', [App\Http\Controllers\EnquiryController::class, 'index'])->name('enquiry.index');
        Route::get('/create', [App\Http\Controllers\EnquiryController::class, 'create'])->name('enquiry.create');
        Route::post('/store', [App\Http\Controllers\EnquiryController::class, 'store'])->name('enquiry.store');
        Route::get('/edit/{enquiry}', [App\Http\Controllers\EnquiryController::class, 'edit'])->name('enquiry.edit');
        Route::post('/update/{enquiry}', [App\Http\Controllers\EnquiryController::class, 'update'])->name('enquiry.update');
        Route::delete('/delete/{enquiry}', [App\Http\Controllers\EnquiryController::class, 'destroy'])->name('enquiry.delete');
    });
    Route::group(['prefix' => 'text'], function () {
        Route::get('/', [App\Http\Controllers\TextController::class, 'index'])->name('text.index');
        Route::get('/create', [App\Http\Controllers\TextController::class, 'create'])->name('text.create');
        Route::post('/store', [App\Http\Controllers\TextController::class, 'store'])->name('text.store');
        Route::get('/edit/{text}', [App\Http\Controllers\TextController::class, 'edit'])->name('text.edit');
        Route::post('/update/{text}', [App\Http\Controllers\TextController::class, 'update'])->name('text.update');
        Route::delete('/delete/{text}', [App\Http\Controllers\TextController::class, 'destroy'])->name('text.delete');
    });
    Route::group(['prefix' => 'category'], function () {
        Route::get('/', [App\Http\Controllers\CategoryController::class, 'index'])->name('category.index');
        Route::get('/create', [App\Http\Controllers\CategoryController::class, 'create'])->name('category.create');
        Route::post('/store', [App\Http\Controllers\CategoryController::class, 'store'])->name('category.store');
        Route::get('/edit/{category}', [App\Http\Controllers\CategoryController::class, 'edit'])->name('category.edit');
        Route::post('/update/{category}', [App\Http\Controllers\CategoryController::class, 'update'])->name('category.update');
        Route::delete('/delete/{category}', [App\Http\Controllers\CategoryController::class, 'destroy'])->name('category.delete');
    });
    Route::group(['prefix' => 'reservation'], function () {
        Route::get('/', [App\Http\Controllers\ReservationController::class, 'index'])->name('reservation.index');
        Route::get('/edit/{reservation}', [App\Http\Controllers\ReservationController::class, 'edit'])->name('reservation.edit');
        Route::delete('/delete/{reservation}', [App\Http\Controllers\ReservationController::class, 'destroy'])
            ->name('reservation.delete');
    });
    Route::group(['prefix' => 'reservationRegister'], function () {
        Route::get('/', [App\Http\Controllers\ReservationRegisterController::class, 'index'])->name('reservationRegister.index');
        Route::get('/edit/{reservationRegister}', [App\Http\Controllers\ReservationRegisterController::class, 'edit'])->name('reservationRegister.edit');
        Route::delete('/delete/{reservationRegister}', [App\Http\Controllers\ReservationRegisterController::class, 'destroy'])
            ->name('reservationRegister.delete');
    });
    Route::group(['prefix' => 'contact'], function () {
        Route::get('/', [App\Http\Controllers\ContactController::class, 'index'])->name('contact.index');
        Route::get('/edit/{contact}', [App\Http\Controllers\ContactController::class, 'edit'])->name('contact.edit');
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
