<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAffiliateParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('affiliate_parameters', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('participation_number')->default(1);
            $table->integer('victory_number')->default(0);
            $table->integer('expiration_delay_in_days')->default(30);
            $table->boolean('status')->default(1);
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
        Schema::dropIfExists('affiliate_parameters');
    }
}
