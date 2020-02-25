<?php

use Illuminate\Database\Seeder;

class AffiliatesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Affiliate::truncate();

        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 6; $i ++) {

            \App\Affiliate::create([
                'affiliate_parameter_id' => 1,
                'user_id' => $faker->unique()->randomNumber(1)
            ]);
        }
    }
}
