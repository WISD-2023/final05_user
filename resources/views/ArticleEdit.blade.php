@include('layouts.navigation')  <!-- 引入導引列 -->

<!-- 引入Article模型以搜尋文章 -->
@php 
    use App\Models\Article;  
    $article = Article::where('Name','=',$articleName)->first();
    $ArticleComment = $article->Content;
    $ArticleName = $article->Name;
    $ArticleID = $article->id;
@endphp
<x-app-layout>    <!-- 填寫區塊 -->
    <div class="max-w-2xl mx-auto p-4 sm:p-6 lg:p-8">
        <form method="POST" action="{{route('Article.update')}}">            
            @csrf
            <input type="hidden" name="ArticleID" value="{{ $ArticleID }}">
            <input type="hidden" name="ArticleName" value="{{ $ArticleName }}">
            @method('patch')
            <textarea
                name="Content"
                class="block w-full border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm"
            >{{$ArticleComment}}</textarea>
            <x-input-error :messages="$errors->get('message')" class="mt-2" />
            <div class="mt-4 space-x-2">
                <x-primary-button>{{ __('儲存') }}</x-primary-button>
                <a href="">{{ __('取消') }}</a>
            </div>
        </form>
    </div>
</x-app-layout>