<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Article;
use App\Models\Forum;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Illuminate\Contracts\View\View;


class ArticleController extends Controller
{
    public function create($fourmID)   //顯示創建文章頁面
    {
         return view('ArticleCreate',['fourmID' => $fourmID]);
    }
    public function show($articleName)
    {
        return view('Article', ['articleName' => $articleName]);
    }
   // public function create()
   // {
   //     return view('ArticleCreate');
   // }
   public function store(Request $request): RedirectResponse  //創建文章操作
   {
    //
    $validated = $request->validate([
        'title' => 'required|string|max:255',
        'comment' => 'required|string|max:255',
    ]);

    $article = new Article();
    $article->forum_id = $request['fourID'];
    $article->members_id = Auth::user()->id;
    $article->Name = $validated['title'];
    $article->Content = $validated['comment'];
    //Auth::user()->id
    $article->save();
    session()->flash('success', '新增成功');
    $forumName = $request['fourname'];
    return redirect(route('Forum', ['forumName' => $forumName]));
   }

   public function edit(String $title): View  //顯示更新文章表單頁面
   {
    return view('ArticleEdit',['articleName' => $title]);
   }

   public function update(Request $request): RedirectResponse    //更新文章操作
   {       
       
       $validated = $request->validate([
           'Content' => 'required|string|max:255',
       ]);
       $articleID = $request['ArticleID'];
       $article = Article::where('id','=',$articleID)->first();
       $article->update($validated);
       $articleName = $request['ArticleName'];
       
       session()->flash('success', '修改成功');
       return redirect(route('Article', ['articleName' => $articleName]));
   }
   public function destroy(Request $request): RedirectResponse  //刪除文章操作
   {
        //
        $articleID = $request['ArticleID'];
        $article = Article::where('id','=',$articleID)->first();
        //$this->authorize('delete', $article);
        $forum = Forum::where('id','=',$article->forum_id)->first();
        $forumName = $forum->forum_name;
        $article->delete();
        
        session()->flash('success', '刪除成功');
        return redirect(route('Forum', ['forumName' => $forumName]));
   }
}
