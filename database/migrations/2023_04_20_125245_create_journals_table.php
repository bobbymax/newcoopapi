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
        Schema::create('journals', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('expenditure_id')->unsigned();
            $table->foreign('expenditure_id')->references('id')->on('expenditures')->onDelete('cascade');
            $table->bigInteger('chart_of_account_id')->unsigned();
            $table->foreign('chart_of_account_id')->references('id')->on('chart_of_accounts')->onDelete('cascade');
            $table->bigInteger('credit_account_id')->unsigned();
            $table->foreign('credit_account_id')->references('id')->on('accounts')->onDelete('cascade');
            $table->bigInteger('debit_account_id')->unsigned();
            $table->foreign('debit_account_id')->references('id')->on('accounts')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('journals');
    }
};
