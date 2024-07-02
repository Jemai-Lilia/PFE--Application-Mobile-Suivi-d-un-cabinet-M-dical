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
        Schema::create('responses', function (Blueprint $table) {
            $table->id();
            $table->String('response');
            // $table->unsignedBigInteger('question_id');
            // $table->unsignedBigInteger('user_id');
            // $table->unsignedBigInteger('med_id');
            $table->foreignId('question_id')->constrained('questions');
            $table->foreignId('user_id')->constrained('users');
            // $table->foreignId('medic_id')->constrained('medics');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('responses');
    }
};
