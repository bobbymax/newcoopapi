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
        Schema::create('service_requests', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('service_id')->unsigned();
            $table->foreign('service_id')->references('id')->on('services')->onDelete('cascade');
            $table->string('code')->unique()->nullable();
            $table->longText('description')->nullable();
            $table->decimal('requested_amount', $precision=30, $scale=2)->default(0);
            $table->decimal('approved_amount', $precision=30, $scale=2)->default(0);
            $table->enum('status', ['pending', 'approved', 'denied'])->default('pending');
            $table->boolean('disbursed')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('service_requests');
    }
};
