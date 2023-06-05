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
        Schema::create('air_tickets', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->bigInteger('airplane_id')->unsigned();
            $table->foreign('airplane_id')->references('id')->on('airplanes')->onDelete('cascade');
            $table->string('code')->unique();
            $table->bigInteger('noOfPassengers')->default(0);
            $table->string('from');
            $table->date('date_to_takeoff')->nullable();
            $table->string('to');
            $table->date('date_to_destination')->nullable();
            $table->decimal('amount', $precision=30, $scale=2)->default(0);
            $table->enum('period', ['morning', 'afternoon', 'evening'])->default('morning');
            $table->enum('type', ['local', 'international'])->default('local');
            $table->enum('route', ['one-way', 'return', 'multi-city'])->default('return');
            $table->enum('status', ['pending', 'response', 'approved', 'denied'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('air_tickets');
    }
};
