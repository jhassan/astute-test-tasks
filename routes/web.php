<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\GeneralController;


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

Route::get('/', function () {
    return view('welcome');
});

Route::get('login', [AuthController::class, 'index'])->name('login');
Route::post('post-login', [AuthController::class, 'postLogin'])->name('login.post');
Route::get('registration', [AuthController::class, 'registration'])->name('register');
Route::post('post-registration', [AuthController::class, 'postRegistration'])->name('register.post');

Route::group(['middleware' => ['auth']], function () {
    Route::get('dashboard', [AuthController::class, 'dashboard']);
    Route::get('logout', [AuthController::class, 'logout'])->name('logout');

    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('products', ProductController::class);

    // Merge Arrays
    Route::get('merge-arrays', [GeneralController::class, 'mergeArrays']);

    // Filter Odd Numbers
    Route::get('filter-odd-numbers', [GeneralController::class, 'filterOddNumbers']);

    // Calculate Average
    Route::get('calculate-average', [GeneralController::class, 'calculateAverage']);

    // Find Common Elements
    Route::get('find-common-elements', [GeneralController::class, 'findCommonElements']);

    // Reverse String
    Route::get('reverse-string', [GeneralController::class, 'reverseString']);

    // Count Vowels
    Route::get('count-vowels', [GeneralController::class, 'countVowels']);

    // Truncate Text
    Route::get('truncate-text', [GeneralController::class, 'truncateText']);
});
