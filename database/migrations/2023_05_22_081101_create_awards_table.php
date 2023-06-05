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
        Schema::create('awards', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->bigInteger('organization_id')->unsigned();
            $table->foreign('organization_id')->references('id')->on('organizations')->onDelete('cascade');
            $table->bigInteger('project_id')->unsigned();
            $table->foreign('project_id')->references('id')->on('projects')->onDelete('cascade');
            $table->string('code')->unique()->nullable();
            $table->decimal('approved_amount', $precision=30, $scale=2)->default(0);
            $table->decimal('paid', $precision=30, $scale=2)->default(0);
            $table->decimal('balance', $precision=30, $scale=2)->default(0);
            $table->date('date_awarded')->nullable();
            $table->dateTime('date_accepted_or_denied')->nullable();
            $table->dateTime('date_commenced')->nullable();
            $table->date('due_date')->nullable();
            $table->dateTime('date_closed')->nullable();
            $table->enum('status', ['pending', 'accepted', 'inprogress', 'denied', 'completed', 'overdue'])->default('pending');
            $table->boolean('closed')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('awards');
    }
};
