<?php

use Illuminate\Database\Seeder;

class GendersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 2; $i ++) {

            \App\Gender::create([
                'code' => $faker->unique()->randomLetter,
                'name' => $faker->unique()->text("17")
            ]);
        }
    }
}
