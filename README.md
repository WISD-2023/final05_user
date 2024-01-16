# 系統畫面
  首頁
  ![](https://i.imgur.com/x79LjLj.jpeg)
  討論區
  ![](https://i.imgur.com/Arj0sXd.jpeg)
  文章
  ![](https://i.imgur.com/gLomQ9C.jpg)
  新增文章
  ![](https://i.imgur.com/NInjcRh.jpeg)
  修改文章
  ![](https://i.imgur.com/9QE3kwM.jpeg)
  修改留言
  ![](https://i.imgur.com/EWY8te4.jpeg)
  檢舉畫面
  ![](https://i.imgur.com/HOJJjgp.jpeg)
  發起投票
  ![](https://i.imgur.com/dhZh9oX.jpeg)
  投票清單
  ![](https://i.imgur.com/asYvsLK.jpeg)
# 系統的主要功能
  使用者端均為![3B032089 阮彥翔](https://github.com/3B032089)
  * 首頁 Route::get('Home', [HomeConrtroller::class,'index'])->name('Home');
  * 討論區 Route::get('Forum/{forumName}', [ForumController::class,'show'])->name('Forum');
  * 文章 Route::get('Article/{articleName}', [ArticleController::class,'show'])->name('Article');
  * 新增文章頁面 Route::get('ArticleCreate/{fourmID}', [ArticleController::class,'create'])->name('Article.create');
  * 新增文章 Route::post('Article', [ArticleController::class,'store'])->name('Article.store');
  * 修改文章頁面 Route::get('ArticleEdit/{articleName}',[ArticleController::class,'edit'])->name('Article.edit');
  * 修改文章 Route::patch('Article', [ArticleController::class,'update'])->name('Article.update');
  * 刪除文章 Route::delete('Article', [ArticleController::class,'destroy'])->name('Article.destroy');
  * 新增留言 Route::post('Comment', [CommentsController::class,'store'])->name('Comment.store');
  * 修改留言頁面 Route::post('CommentEdit', [CommentsController::class,'edit'])->name('Comment.edit');
  * 修改留言 Route::patch('Comment', [CommentsController::class,'update'])->name('Comment.update');
  * 刪除留言 Route::delete('Comment', [CommentsController::class,'destroy'])->name('Comment.destroy');
  * 發起投票頁面 Route::post('VoteCreate',[VoteController::class,'create'])->name('Vote.create');
  * 發起投票 Route::post('Vote',[VoteController::class,'store'])->name('Vote.store');
  * 投票清單 Route::post('VotelistShow',[VoteController::class,'show'])->name('Vote.show');
  * 投票 Route::patch('Vote',[VoteController::class,'update'])->name('Vote.update');
  * 新增投票紀錄 Route::get('VotingRecord/{VoteID}',[VotingRecordController::class,'store'])->name('VotingRecord.store');
  * 檢舉頁面 Route::get('ReportCreate',[ReportController::class,'create'])->name('Report.create');
  * 檢舉 Route::post('Report',[ReportController::class,'store'])->name('Report.store');
