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
        Schema::create('rendvouses', function (Blueprint $table) {
            $table->id();
            $table->string("time");
            $table->string("date");
            $table->foreignId('patient_id')->constrained('patients');
            $table->foreignId('medic_id')->constrained('medics');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rendvouses');
    }
};
