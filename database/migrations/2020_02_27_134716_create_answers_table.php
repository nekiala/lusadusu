<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnswersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('answers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('exam_id');
            $table->unsignedBigInteger('quiz_id');
            $table->unsignedBigInteger('assertion_id');
            $table->boolean('correct_answer');
            $table->timestamps();

            $table->unique(['exam_id', 'quiz_id']);

            $table->foreign('quiz_id')->references('id')->on('quizzes')
                ->onDelete('restrict');

            $table->foreign('assertion_id')->references('id')->on('assertions')
                ->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('answers');
    }
}
