<?php

use Illuminate\Database\Seeder;

class LessonsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 15; $i ++) {

            \App\Lesson::create([
                'course_id' => 1,
                'title' => $faker->unique()->company,
                'description' => $faker->realText(250),
                'link' => $faker->unique()->url
            ]);
        }
    }
}
