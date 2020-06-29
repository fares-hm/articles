<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Image;
use Faker\Generator as Faker;

$factory->define(Image::class, function (Faker $faker) {
    return [
        'image_url' => 'article_1.jpg',
        'article_id' => App\Article::pluck('id')->random(),
    ];
});
