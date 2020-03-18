<?php

use App\Assertion;
use App\Quiz;
use Illuminate\Database\Seeder;

class QuizzesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Quiz::class, 10)->create()->each(function ($quiz) {

            for ($i = 0; $i < 3; $i ++) {

                $quiz->assertions()->save(factory(Assertion::class)->make());
            }
        });
    }
}
