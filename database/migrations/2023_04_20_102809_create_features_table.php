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
        Schema::create('features', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('sub_budget_head_id')->unsigned();
            $table->foreign('sub_budget_head_id')->references('id')->on('sub_budget_heads')->onDelete('cascade');
            $table->bigInteger('tenor')->default(0);
            $table->enum('frequency', ['months', 'years'])->default('months');
            $table->bigInteger('interest_rate')->default(0);
            $table->bigInteger('commitment')->default(0);
            $table->bigInteger('max_repayment_tenor')->default(0);
            $table->decimal('offer_limit', $precision=30, $scale=2)->default(0);
            $table->enum('payable_from', ['salary', 'upfront', 'special', 'custom'])->default('salary');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('features');
    }
};
