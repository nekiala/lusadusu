<?php

use App\ExamParameter;
use Faker\Factory;
use Illuminate\Database\Seeder;

class ExamParametersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create();

        for ($i = 0; $i < 6; $i ++) {

            ExamParameter::create([
                'duration' => $faker->numberBetween(3, 5)
            ]);
        }
    }
}
