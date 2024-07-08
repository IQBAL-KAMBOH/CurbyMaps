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
        Schema::create('user_notifications', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('senderId');
            $table->foreign('senderId')->references('id')->on('users')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->unsignedBigInteger('receiverId');
            $table->foreign('receiverId')->references('id')->on('users')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->integer('chatId')->nullable();
            $table->integer('friendRequestId')->nullable();
            $table->string('body');
            $table->string('type', 30)->comment("chat, friend_request");
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
        Schema::dropIfExists('user_notifications');
    }
};
