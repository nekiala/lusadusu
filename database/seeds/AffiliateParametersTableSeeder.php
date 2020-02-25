<?php

use Illuminate\Database\Seeder;

class AffiliateParametersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\AffiliateParameter::truncate();

        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 2; $i ++) {

            \App\AffiliateParameter::create([
                'participation_number' => $faker->unique()->randomNumber(1),
                'victory_number' => $faker->unique()->randomNumber(1),
                'expiration_delay_in_days' => $faker->unique()->randomNumber(2)
            ]);
        }
    }
}
