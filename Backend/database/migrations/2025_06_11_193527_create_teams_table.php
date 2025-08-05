<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('teams', function (Blueprint $table) {
            $table->id();
            $table->string('name');       // nama anggota tim
            $table->string('job');        // jabatan atau peran
            $table->string('github')->nullable();   // link GitHub
            $table->string('instagram')->nullable(); // link Instagram
            $table->string('img');        // URL gambar profil
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('teams');
    }
};
