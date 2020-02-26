<?php

use Illuminate\Database\Seeder;

class QuestionsTableSeeder extends Seeder
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

            \App\Question::create([
                'category_id' => 1,
                'user_id' => 1,
                'subject' => $faker->unique()->realText(100),
                'description' => $faker->unique()->sentence(155),
            ]);
        }
    }
}
