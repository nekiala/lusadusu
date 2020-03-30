<?php

use App\Course;
use Faker\Factory;
use Illuminate\Database\Seeder;

class CoursesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create();

        for ($i = 0; $i < 5; $i ++) {

            Course::create([
                'title' => $faker->unique()->city,
                'material_id' => 3,
                'description' => $faker->realText(150)
            ]);
        }
    }
}
