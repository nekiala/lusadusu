<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('payment_method_id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('course_id');
            $table->float('amount');
            $table->string('transaction_code', 25)->unique();
            $table->boolean('status')->default(false);
            $table->timestamps();

            $table->unique(['course_id', 'user_id']);

            $table->foreign('payment_method_id')->references('id')
                ->on('payment_methods')->onDelete('restrict');

            $table->foreign('user_id')->references('id')
                ->on('users')->onDelete('restrict');

            $table->foreign('course_id')->references('id')
                ->on('courses')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
