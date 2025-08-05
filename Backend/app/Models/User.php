<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Hash;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * Gunakan nama tabel 'user' sesuai struktur database.
     */
    protected $table = 'user';

    /**
     * Aktifkan fitur timestamps agar Laravel mengisi kolom created_at dan updated_at.
     */
    public $timestamps = true;

    /**
     * Kolom yang boleh diisi secara mass-assignment.
     */
    protected $fillable = [
        'name',
        'username',
        'email',
        'role',
        'password',
    ];

    /**
     * Kolom yang akan disembunyikan saat model dikonversi ke array/JSON.
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Cast untuk properti tertentu agar otomatis dikonversi ke tipe yang sesuai.
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Setter untuk memastikan password selalu di-hash saat diset.
     */
    public function setPasswordAttribute($value)
    {
        if (!empty($value)) {
            $this->attributes['password'] = Hash::needsRehash($value) ? Hash::make($value) : $value;
        }
    }
}
