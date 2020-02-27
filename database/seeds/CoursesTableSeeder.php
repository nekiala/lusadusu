<?php

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
        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 3; $i ++) {

            \App\Course::create([
                'title' => $faker->unique()->city,
                'material_id' => 1,
                'description' => $faker->realText(150)
            ]);
        }
    }
}