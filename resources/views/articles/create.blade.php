<?php

use \App\Http\Controllers\ArticleController;

?>
@extends('layouts.app')

@section('content')

    <div class="row justify-content-md-center ">

        <div class="card" style="width: 50rem;">
            <div class="card-body">


                <form method="POST" action="{{ route('articles.store') }}">
                    @csrf

                    <div class="form-group row">
                        <label for="article_image" class="col-md-4 col-form-label text-md-right">{{ __('Article Images') }}</label>

                        <div class="col-md-6">
                            <input id="article_image" type="file" class="form-control" name="article_image" autofocus>
                            @error('article_image') <span class="help-block text-danger">{{$message}}</span>@enderror
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="article_title" class="col-md-4 col-form-label text-md-right">{{ __('Article title') }}</label>

                        <div class="col-md-6">
                            <input id="article_title" type="text" class="form-control" name="article_title" autofocus>
                            @error('article_title') <span class="help-block text-danger">{{$message}}</span>@enderror
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="article_author"
                               class="col-md-4 col-form-label text-md-right">{{ __('Article author') }}</label>

                        <div class="col-md-6">
                            <input id="article_author" type="text" class="form-control" name="article_author" autofocus>
                            @error('article_author') <span class="help-block text-danger">{{$message}}</span>@enderror

                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="article_cat"
                               class="col-md-4 col-form-label text-md-right">{{ __('Article category') }}</label>

                        <div class="col-md-6">
                            <input id="article_cat" type="text" class="form-control" name="article_cat" autofocus>
                            @error('article_cat') <span class="help-block text-danger">{{$message}}</span>@enderror

                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="article_content" class="col-md-4 col-form-label text-md-right">{{ __('Article content') }}</label>

                        <div class="col-md-6">
                            <input id="article_content" type="text" class="form-control" name="article_content" autofocus>
                            @error('article_content') <span class="help-block text-danger">{{$message}}</span>@enderror

                        </div>
                    </div>

                    <div class="form-group row justify-content-center">
                        <button type="submit" name="create_article" class="btn btn-primary">
                            {{ __('Create') }}
                        </button>
                    </div>


                </form>
            </div>
        </div>
    </div>



@endsection