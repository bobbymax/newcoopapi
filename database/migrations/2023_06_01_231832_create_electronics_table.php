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
        Schema::create('electronics', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('code')->unique();
            $table->text('device');
            $table->decimal('requested_amount', $precision=30, $scale=2)->default(0);
            $table->decimal('approved_amount', $precision=30, $scale=2)->default(0);
            $table->integer('duration')->default(0);
            $table->string('preferred_month')->nullable();
            $table->longText('remark')->nullable();
            $table->enum('status', ['pending', 'approved', 'denied'])->default('pending');
            $table->boolean('closed')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('electronics');
    }
};
