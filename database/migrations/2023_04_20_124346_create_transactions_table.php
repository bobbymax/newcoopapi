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
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('expenditure_id')->unsigned();
            $table->foreign('expenditure_id')->references('id')->on('expenditures')->onDelete('cascade');
            $table->enum('type', ['DR', 'CR'])->default('DR');
            $table->bigInteger('transactionable_id')->unsigned();
            $table->string('transactionable_type');
            $table->dateTime('post_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
