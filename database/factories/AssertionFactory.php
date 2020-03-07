<?php
/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Assertion;
use Faker\Generator as Faker;

$factory->define(Assertion::class, function (Faker $faker) {

    return [
        'answer' => $faker->unique()->paragraph,
        'correct_answer' => 0
    ];
});
