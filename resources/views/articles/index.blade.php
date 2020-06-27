<?php

use \App\Http\Controllers\ArticleController;

?>
@extends('layouts.app')

@section('content')
    <div class="mt-5"></div>
    <div class="container ">

    @foreach ($articles as $article)

        @if($loop->index % 2 == 0) <!-- Put each two cards on one row-->
            <div class="row justify-content-md-center ">

                @endif
                <div class="col col-lg-4">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top"
                             src="{{url(ArticleController::getArticleImages($article->id)[0]->image_url)}}" alt="">
                        <div class="card-body">
                            <h5 class="card-title">{{$article->article_title}}</h5>
                            <h6 class="card-title text-primary">{{$article->article_author}}</h6>
                            <h6 class="card-title text-secondary">{{ArticleController::getArticleCategory($article->article_cat_id)->category_name}}</h6>
                            <p class="card-text">Some quick example text to build on the card title and make up
                                the bulk of
                                the card's content.</p>
                            <a href="{{URL::to('articles/' . $article->id)}}" class="btn btn-primary">View</a>
                            <a href="#" class="btn btn-success">Edit</a>
                            <a href="#" class="btn btn-danger">Delete</a>
                        </div>
                    </div>

                </div>
                @if($loop->index % 2 != 0)
            </div>
            <div class="mt-5"></div>
            @endif
        @endforeach

    </div>

@endsection
