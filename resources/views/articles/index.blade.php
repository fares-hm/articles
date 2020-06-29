<?php

use \App\Http\Controllers\ArticleController;

?>
@extends('layouts.app')

@section('content')

    <div class="container">
        <div class="d-flex justify-content-center  mb-5">
            <h2 class="text-secondary text-lg-center">Welcome to <a class="text-primary"> medium </a> - browse the miscellaneous articles</h2>
        </div>
    <div class="d-flex justify-content-center mb-5 mt-5">
        <a href="{{URL::to('articles/create')}}" class="btn btn-primary">Create New Article</a>
    </div>

    @foreach ($articles as $article)

        @if($loop->index % 2 == 0) <!-- Put each two cards on one row-->
            <div class="row justify-content-md-center ">

                @endif
                <div class="col col-lg-4">
                    <article class="card" style="width: 18rem;">
                        @if(ArticleController::getArticleImages($article->id) != null)
                        <img class="card-img-top"
                             src="{{asset("storage/images/". ArticleController::getArticleImages($article->id)[0]->image_url)}}" alt="">
                        @endif

                        <div class="card-body">
                            <h5 class="card-title">{{$article->article_title}}</h5>
                            <h6 class="card-title text-primary">{{$article->article_author}}</h6>
                            <h6 class="card-title text-secondary">{{ArticleController::getArticleCategory($article->article_cat_id)->category_name}}</h6>
                            <p class="card-text text-secondary">{{$article->article_content}}</p>
                            <a href="{{URL::to('articles/' . $article->id)}}" class="btn btn-primary">{{ __('View') }}</a>
                            <a href="{{URL::to('articles/' . $article->id .'/edit')}}" class="btn btn-success">{{ __('Edit') }}</a>
                            <a href="#" class="btn btn-danger">{{ __('Delete') }}</a>
                        </div>
                    </article>

                </div>
                @if($loop->index % 2 != 0)
            </div>
            <div class="mt-5"></div>
            @endif
        @endforeach

    </div>

@endsection
