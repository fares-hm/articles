<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\ArticleCategories;
use Faker\Generator as Faker;

$factory->define(ArticleCategories::class, function (Faker $faker) {
    return [
        'article_id' => App\Article::pluck('id')->random(),
        'category_id' => App\Category::pluck('id')->random(),
    ];
});
