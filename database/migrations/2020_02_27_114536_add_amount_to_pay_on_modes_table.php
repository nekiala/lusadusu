<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAmountToPayOnModesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('modes', function (Blueprint $table) {
            $table->float('amount_to_pay')->default(0.0)->after('winning_average');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('modes', function (Blueprint $table) {
            $table->dropColumn(['amount_to_pay']);
        });
    }
}
