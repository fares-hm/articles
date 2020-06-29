<?php

use \App\Http\Controllers\ArticleController;

?>
@extends('layouts.app')

@section('content')
    <div class="row justify-content-md-center ">

        <article class="card" style="width: 50rem;">
            <img class="card-img-top"
                 src="{{asset("storage/images/". ArticleController::getArticleImages($article->id)[0]->image_url)}}" alt="">
            <div class="card-body">
                <h5 class="card-title">{{$article->article_title}}</h5>
                <h6 class="card-title text-primary">{{$article->article_author}}</h6>
                <h6 class="card-title text-secondary">{{ArticleController::getArticleCategory($article->article_cat_id)->category_name}}</h6>
                <p class="card-text">Some quick example text to build on the card title and make up
                    the bulk of
                    the card's content.</p>
                <a href="{{URL::to('articles/' . $article->id .'/edit')}}" class="btn btn-success">{{ __('Edit') }}</a>
                <a href="#" class="btn btn-danger">{{ __('Delete') }}</a>
            </div>
            <h5 class="card-title align-self-center">Images</h5>

            @foreach(ArticleController::getArticleImages($article->id) as $image)
                <img class="card-img-top" src="{{asset("storage/images/". $image->image_url)}}" alt="">
                <div class="mt-2"></div>
            @endforeach
        </article>
    </div>

@endsection