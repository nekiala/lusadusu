<?php
/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Quiz;
use Faker\Generator as Faker;

$factory->define(Quiz::class, function (Faker $faker) {

    $types = ['normal', 'interactive'];

    return [
        'lesson_id' => 29,
        'question' => $faker->unique()->paragraph,
        'type' => $types[rand(0, sizeof($types) - 1)]
    ];
});
