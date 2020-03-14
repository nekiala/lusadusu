<?php

use App\Lesson;
use Faker\Factory;
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
        $faker = Factory::create();

        for ($i = 0; $i < 15; $i ++) {

            Lesson::create([
                'course_id' => 7,
                'title' => $faker->unique()->address,
                'description' => $faker->realText(250),
                'link' => $faker->unique()->url
            ]);
        }
    }
}
