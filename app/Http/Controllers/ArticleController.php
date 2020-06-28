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
        // validate
        $validatedData = $request->validate([
            'article_title' => 'required',
            'article_author' => 'required',
            'article_cat' => 'required',
            'article_content' => 'required',
        ]);


        $cat = new Category();
        $cat->category_name = $request->get('article_cat');
        $cat->category_desc = 'New Category';

        $cat->save();

        $article = new Article();
        // save data
        $article->article_title = $request->get('article_title');
        $article->article_author = $request->get('article_author');
        $article->article_date = \Carbon\Carbon::now();
        $article->article_cat_id = $cat->id;
        $article->article_content = $request->get('article_content');


        $article->save();
        return Redirect::to('articles');


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
        //
    }

    public static function getArticleCategory($catID)
    {
        return $cat = Category::where('id', $catID)->first();
    }

    public static function getArticleImages($articleID)
    {
        return $images = Image::where('article_id', $articleID)->get();
    }

}
