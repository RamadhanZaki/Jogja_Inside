<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
    Schema::create('destination_media', function (Blueprint $table) {
        $table->id();
        $table->foreignId('destination_id')->constrained()->onDelete('cascade');
        $table->string('media_path');
        $table->string('media_type', 50); // atau 100 untuk lebih aman
        $table->timestamps();
    });


    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('destination_media');
    }
};
