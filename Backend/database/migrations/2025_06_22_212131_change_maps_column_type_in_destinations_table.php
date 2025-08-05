<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeMapsColumnTypeInDestinationsTable extends Migration
{
    public function up()
    {
        Schema::table('destinations', function (Blueprint $table) {
            // Ubah tipe kolom maps jadi TEXT
            $table->text('maps')->change();
        });
    }

    public function down()
    {
        Schema::table('destinations', function (Blueprint $table) {
            // Kembalikan ke VARCHAR 255 jika dibatalkan
            $table->string('maps', 255)->change();
        });
    }
}
