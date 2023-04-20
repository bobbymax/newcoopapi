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
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('name');
            $table->string('membership_no')->unique()->nullable()->after('id');
            $table->string('staff_no')->unique()->nullable()->after('membership_no');
            $table->string('firstname')->after('staff_no');
            $table->string('middlename')->nullable()->after('firstname');
            $table->string('surname')->after('middlename');
            $table->string('mobile')->after('surname');
            $table->decimal('contribution_fee', $precision=30, $scale=2)->default(0)->after('mobile');
            $table->enum('type', ['staff', 'member', 'admin'])->default('member')->after('contribution_fee');
            $table->enum('status', ['pending', 'active', 'blocked', 'left'])->default('pending')->after('type');
            $table->boolean('verified')->default(false)->after('password');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('name')->after('id');
            $table->dropColumn('membership_no');
            $table->dropColumn('staff_no');
            $table->dropColumn('firstname');
            $table->dropColumn('middlename');
            $table->dropColumn('surname');
            $table->dropColumn('mobile');
            $table->dropColumn('contribution_fee');
            $table->dropColumn('type');
            $table->dropColumn('status');
            $table->dropColumn('verified');
        });
    }
};
