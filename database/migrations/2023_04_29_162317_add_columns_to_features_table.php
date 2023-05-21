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
        Schema::table('features', function (Blueprint $table) {
            $table->dropColumn('interest_rate');
            $table->dropColumn('tenor');
            $table->bigInteger('percentage_deduction')->default(0)->after('offer_limit');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('features', function (Blueprint $table) {
            $table->bigInteger('interest_rate')->default(0)->after('frequency');
            $table->bigInteger('tenor')->default(0)->after('sub_budget_head_id');
            $table->dropColumn('percentage_deduction');
        });
    }
};
