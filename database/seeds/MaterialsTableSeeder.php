<?php

use Illuminate\Database\Seeder;

class MaterialsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Material::truncate();

        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 12; $i++) {

            \App\Material::create([
                'name' => $faker->unique()->monthName,
                'description' => $faker->text($faker->randomNumber(2))
            ]);

        }
    }
}
