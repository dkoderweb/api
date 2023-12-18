<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Passport\Http\Controllers\AccessTokenController;
Use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\PositionController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\SalaryController;
Use App\Http\Controllers\AttendanceController;
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

 
Route::post('register', [RegisterController::class, 'register'])->name('register');
Route::post('login', [RegisterController::class, 'login'])->name('login');

Route::middleware('auth:api')->group( function () {

    Route::resource('department', DepartmentController::class);
    Route::resource('position', PositionController::class);
    Route::resource('employee', EmployeeController::class);
    Route::resource('salary', SalaryController::class);
    Route::resource('attendance', AttendanceController::class);    

});
