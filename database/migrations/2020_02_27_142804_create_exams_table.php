<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exams', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('course_id');
            $table->unsignedBigInteger('user_id');
            $table->boolean('started')->default(false);
            $table->dateTime('started_at')->nullable()->default(null);
            $table->dateTime('finished_at')->nullable()->default(null);
            $table->boolean('normal_finish')->nullable()->default(null);
            $table->boolean('passed')->nullable()->default(null);
            $table->float('percentage_obtained')->nullable()->default(null);
            $table->float('percentage_required');
            $table->boolean('can_visualize')->default(false);

            $table->unique(['course_id', 'user_id']);

            $table->foreign('course_id')->references('id')->on('courses')
                ->onDelete('restrict');

            $table->foreign('user_id')->references('id')->on('users')
                ->onDelete('restrict');

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
        Schema::dropIfExists('exams');
    }
}
