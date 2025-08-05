<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\DestinationController;

// ✅ Route user yang dilindungi token Sanctum
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// ✅ Login (autentikasi admin)
Route::post('/login', [AuthController::class, 'login']);

// ✅ Manajemen User
Route::get('/users', [UserController::class, 'index']);
Route::post('/users', [UserController::class, 'store']);
Route::put('/users/{id}', [UserController::class, 'update']);
Route::delete('/users', [UserController::class, 'destroy']);

// ✅ Manajemen Tim
Route::get('/teams', [TeamController::class, 'index']);
Route::post('/teams', [TeamController::class, 'store']);
Route::put('/teams/{id}', [TeamController::class, 'update']);
Route::delete('/teams/{id}', [TeamController::class, 'destroy']);
Route::delete('/teams', [TeamController::class, 'deleteMultiple']);

// ✅ Statistik Destinasi Wisata per Region
Route::get('/destination-stats', [DestinationController::class, 'getStats']);

// Manajemen Destinasi Wisata
// ⛳️ PENTING: letakkan ini DI ATAS route /destinations/{id}
Route::get('/destinations/slug/{slug}', [DestinationController::class, 'showBySlug']);
Route::get('/destinations/{id}', [DestinationController::class, 'show']); // ini harus DIBAWAH
Route::get('/destinations/id/{id}', [DestinationController::class, 'show']);        // 🔍 Get by ID (khusus admin/panel)
Route::get('/destinations', [DestinationController::class, 'index']);               // 🔍 Semua destinasi
Route::post('/destinations', [DestinationController::class, 'store']);              // ➕ Tambah
Route::put('/destinations/{id}', [DestinationController::class, 'update']);         // ✏️ Update
Route::delete('/destinations/{id}', [DestinationController::class, 'destroy']);     // 🗑️ Hapus satu
Route::delete('/destinations', [DestinationController::class, 'destroyMultiple']);  // 🗑️ Hapus banyak

// ✅ Route contoh untuk admin yang butuh autentikasi token
Route::middleware('auth.token')->get('/admin/protected', function (Request $request) {
    return response()->json(['message' => 'Selamat datang admin']);
});
