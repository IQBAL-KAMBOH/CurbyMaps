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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('userRole');
            $table->foreign('userRole')->references('id')->on('user_roles')->onDelete('cascade');
            $table->unsignedBigInteger('coupleCategories')->nullable();
            $table->foreign('coupleCategories')->references('id')->on('couple_categories')->onDelete('cascade');
            $table->string('userName')->nullable();
            $table->string('title')->nullable();
            $table->string('emailAddress')->unique();
            $table->string('password');
            $table->string('coupleName')->nullable();
            $table->string('age')->nullable();
            $table->string('PhoneNo')->nullable();
            $table->string('gender')->nullable();
            $table->string('height')->nullable();
            $table->string('dob')->nullable();
            $table->longText('bio')->nullable();
            $table->longText('profileImage')->nullable();
            $table->double('Latitude');
            $table->double('Longitude');
            $table->boolean('status')->default(1);
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
};
