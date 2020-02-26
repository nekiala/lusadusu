<?php

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();

        $password = Hash::make('lusadusu');

        User::create([
            'name' => 'Administrator',
            'gender_id' => 1,
            'email' => 'admin@test.com',
            'password' => $password,
        ]);

        // And now let's generate a few dozen users for our app:
        for ($i = 0; $i < 10; $i++) {
            User::create([
                'name' => $faker->name,
                'gender_id' => 1,
                'email' => $faker->email,
                'password' => $password,
            ]);
        }
    }
}
