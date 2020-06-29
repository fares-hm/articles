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
            'article_image' => 'required'
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


        $image = new Image();
        $imgName = 'article_ ' . $article->id . '_1.jpg'; // update image if exist
        $path = $request->file('article_image')->storeAs('public/images', $imgName);
        $image->image_url = $imgName;
        $image->article_id = $article->id;
        $image->save();

        if ($request->hasFile('article_image2')) {
            $image = new Image();
            $imgName = 'article_ ' . $article->id . '_2.jpg';
            $path = $request->file('article_image2')->storeAs('public/images', $imgName);
            $image->image_url = $imgName;
            $image->article_id = $article->id;
            $image->save();
        }

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
        // validate
        $validatedData = $request->validate([
            'article_title' => 'required',
            'article_author' => 'required',
            'article_cat' => 'required',
            'article_content' => 'required',
            'article_image' => 'required'
        ]);

        $article = Article::find($id);

        $cat = Category::find($article->article_cat_id);

        $cat->category_name = $request->get('article_cat');
        $cat->category_desc = 'New Category';

        $cat->save();

        // save data
        $article->article_title = $request->get('article_title');
        $article->article_author = $request->get('article_author');
        $article->article_date = \Carbon\Carbon::now();
        $article->article_cat_id = $cat->id;
        $article->article_content = $request->get('article_content');

        $article->save();


        $images = $this->getArticleImages($article->id);


        $imgName = 'article_ ' . $article->id . '_1.jpg'; // update image if exist
        $request->file('article_image')->storeAs('public/images', $imgName);
        if ($images != null) {

            $images[0]->image_url = $imgName;
            $images[0]->article_id = $article->id;
            $images[0]->save();
        }
        else
        {
            $img = new Image();
            $img->image_url = $imgName;
            $img->article_id = $article->id;
            $img->save();
        }
        if ($request->hasFile('article_image2')) {
            $imgName2 = 'article_ ' . $article->id . '_2.jpg';
            $request->file('article_image2')->storeAs('public/images', $imgName2);

            if (count($images) > 1) {
                $images[1]->image_url = $imgName2;
                $images[1]->article_id = $article->id;
                $images[1]->save();
            } else {
                $img = new Image();
                $img->image_url = $imgName2;
                $img->article_id = $article->id;
                $img->save();
            }
        }

        return Redirect::to('articles')->with([
            'message' => 'Article updated successfully',
            'alert_type' => 'success'
        ]);
    }


    public function destroy($id)
    {
        $article = Article::findOrFail($id);
        if ($article) {
            $article->delete();

            return Redirect::to('articles')->with([
                'message' => 'Article deleted successfully',
                'alert_type' => 'success'
            ]);
        } else {
            return Redirect::to('articles')->with([
                'message' => 'Article deleted failed',
                'alert_type' => 'danger'
            ]);
        }
    }

    public static function getArticleCategory($catID)
    {
        return $cat = Category::where('id', $catID)->first();
    }

    public static function getArticleImages($articleID)
    {
        $images = Image::where('article_id', $articleID)->get();
        if (count($images) == 0)
            return null;
        return $images;
    }

}
