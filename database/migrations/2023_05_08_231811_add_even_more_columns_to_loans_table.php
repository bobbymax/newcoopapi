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
        Schema::table('loans', function (Blueprint $table) {
            $table->bigInteger('preferred_tenor')->default(0)->after('sub_budget_head_id');
            $table->bigInteger('interest_rate')->default(0)->after('approved_amount');
            $table->bigInteger('commitment_rate')->default(0)->after('interest_rate');
            $table->decimal('remittance', $precision=30, $scale=2)->default(0)->after('commitment_rate');
            $table->decimal('deduction', $precision=30, $scale=2)->default(0)->after('remittance');
            $table->string('deduction_month')->nullable()->after('reason');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('loans', function (Blueprint $table) {
            $table->dropColumn('preferred_tenor');
            $table->dropColumn('interest_rate');
            $table->dropColumn('commitment_rate');
            $table->dropColumn('remittance');
            $table->dropColumn('deduction');
            $table->dropColumn('deduction_month');
        });
    }
};
