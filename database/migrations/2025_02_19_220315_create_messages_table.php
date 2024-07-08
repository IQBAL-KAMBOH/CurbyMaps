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
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('chatId');
            $table->foreign('chatId')->references('id')->on('chats');
            $table->unsignedBigInteger('senderId');
            $table->foreign('senderId')->references('id')->on('users')->onDelete('cascade');
            $table->string('massage')->nullable();
            $table->string('massageType')->nullable();
            $table->string('senderImage')->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('messages');
    }
};
