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
        Schema::table('expenditures', function (Blueprint $table) {
            $table->dropColumn('expenditureable_id');
            $table->dropColumn('expenditureable_type');
            $table->bigInteger('member_id')->default(0)->after('payment_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('expenditures', function (Blueprint $table) {
            $table->bigInteger('expenditureable_id')->unsigned()->after('payment_type');
            $table->string('expenditureable_type')->after('expenditureable_id');
            $table->dropColumn('member_id');
        });
    }
};
