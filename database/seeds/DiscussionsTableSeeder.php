<?php

use Illuminate\Database\Seeder;

class DiscussionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 6; $i ++) {

            \App\Discussion::create([
                'question_id' => 1,
                'user_id' => 1,
                'message' => $faker->unique()->realText($faker->randomNumber(2)),
            ]);
        }
    }
}
