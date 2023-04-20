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
        Schema::create('loans', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->bigInteger('sub_budget_head_id')->unsigned();
            $table->foreign('sub_budget_head_id')->references('id')->on('sub_budget_heads')->onDelete('cascade');
            $table->string('request_code')->unique();
            $table->decimal('requested_amount', $precision=30, $scale=2)->default(0);
            $table->decimal('approved_amount', $precision=30, $scale=2)->default(0);
            $table->text('reason');
            $table->decimal('capitalSum', $precision=30, $scale=2)->default(0);
            $table->decimal('commitment', $precision=30, $scale=2)->default(0);
            $table->decimal('interestSum', $precision=30, $scale=2)->default(0);
            $table->decimal('totalPayable', $precision=30, $scale=2)->default(0);
            $table->enum('status', ['registered', 'approved', 'denied'])->default('registered');
            $table->boolean('paid')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('loans');
    }
};
