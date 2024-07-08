<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('partner_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('coupleId');
            $table->foreign('coupleId')->references('id')->on('users')->onDelete('cascade');
            $table->string('coupleName')->nullable();
            $table->string('age')->nullable();
            $table->string('gender')->nullable();
            // $table->string('region')->nullable();
            $table->string('height')->nullable();
            $table->string('dob')->nullable();
            $table->longText('profileImage')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('partner_details');
    }
};
