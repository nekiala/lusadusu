<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssertionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('assertions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('quiz_id');
            $table->string('answer');
            $table->boolean('correct_answer')->default(false);
            $table->boolean('status')->default(true);
            $table->timestamps();

            $table->unique(['quiz_id', 'answer']);

            $table->foreign('quiz_id')->references('id')
                ->on('quizzes')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('assertions');
    }
}
