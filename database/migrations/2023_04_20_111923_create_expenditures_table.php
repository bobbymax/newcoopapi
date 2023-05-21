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
        Schema::create('expenditures', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->bigInteger('sub_budget_head_id')->unsigned();
            $table->foreign('sub_budget_head_id')->references('id')->on('sub_budget_heads')->onDelete('cascade');
            $table->bigInteger('loan_id')->default(0);
            $table->bigInteger('batch_id')->default(0);
            $table->string('trxRef')->unique();
            $table->string('beneficiary');
            $table->text('description');
            $table->decimal('amount', $precision=30, $scale=2)->default(0);
            $table->enum('type', ['inflow', 'outflow'])->default('outflow');
            $table->enum('category', ['loan', 'deposit', 'salary', 'contribution', 'dividend', 'other'])->default('loan');
            $table->enum('method', ['cash', 'electronic', 'check', 'other'])->default('electronic');
            $table->enum('payment_type', ['staff', 'member', 'third-party', 'other'])->default('member');
            $table->bigInteger('expenditureable_id')->unsigned();
            $table->string('expenditureable_type');
            $table->enum('status', ['pending', 'cleared', 'batched', 'reversed', 'deposit', 'paid'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expenditures');
    }
};
