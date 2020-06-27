<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Article;
use Faker\Generator as Faker;

$factory->define(Article::class, function (Faker $faker) {
    return [
        'article_title' => $faker->text(10),
        'article_author' => $faker->name,
        'article_date' => \Carbon\Carbon::now()->subDays(rand(1,30)), // get current day minus random from 1 to 30
        'article_content' => $faker->text(200),
        'article_cat_id' => App\Category::pluck('id')->random(),

    ];
});
