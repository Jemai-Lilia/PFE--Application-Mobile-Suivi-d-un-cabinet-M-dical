<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('dossiers', function (Blueprint $table) {
            $table->id();
            $table->string('nom');
            $table->string('prenom');
            $table->string('date_naissance');
            $table->string('sexe');
            $table->string('tel');
            $table->string('email');
            $table->string('cnam');
            $table->string('diagnostique');
            $table->string('medicament');
            $table->string('synctome');
            $table->string('description');
            $table->foreignId('medic_id')->constrained('medics');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dossiers');
    }
};
