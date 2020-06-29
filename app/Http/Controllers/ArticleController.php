<?php

namespace App\Http\Controllers;

use App\Article;
use App\Category;
use App\Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Redirect;


class ArticleController extends Controller
{

    public function index()
    {
        $articles = Article::all();

        return view('articles.index')->with('articles', $articles);

    }


    public function create()
    {
        return view('articles.create');
    }


    public function store(Request $request)
    {


        return Redirect::to('articles')->with([
            'message' => 'Article created successfully',
            'alert_type' => 'success'
        ]);


    }


    public function show($id)
    {
        $article = Article::find($id);
        return view('articles.article')->with('article', $article);

    }


    public function edit($id)
    {
        $article = Article::find($id);
        return view('articles.edit')->with('article', $article);
    }


    public function update(Request $request, $id)
    {
        //
    }


    public function destroy($id)
    {
        return 'destroy';
    }

    public static function getArticleCategory($catID)
    {
        return $cat = Category::where('id', $catID)->first();
    }

    public static function getArticleImages($articleID)
    {
        $images = Image::where('article_id', $articleID)->get();
        if(count($images) == 0)
            return null;
        return $images;
    }

}
