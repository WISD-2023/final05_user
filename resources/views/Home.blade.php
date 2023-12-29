<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>網路論壇</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- 判斷是否有回傳訊息以顯示提示視窗 -->
    @if(session('success'))
    <script>
        alert("{{ session('success') }}");
    </script>
    @endif 
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>


<body class="bg-white">
    <!-- 引入上方導引列 -->
    @include('layouts.navigation01') 
    <x-app-layout>
        <!-- 顯示頁面主題 -->
        <x-slot name="header">
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ __('首頁') }}
            </h2>
        </x-slot>

        <!-- 顯示規則 -->
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <!-- {{ __("You're logged in!") }} -->
                        @include('layouts.rule')
                    </div>
                </div>
            </div>
        </div>

        <!-- 顯示討論區 -->
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <h1 class="text-xl">討論區列表</h1>
                        <br />
                        @foreach (\App\Models\Forum::paginate(10) as $forum)   <!-- 限制每頁10筆資料 -->
                        <div class="mt-4 mb-4">
                            <a href="{{ url('Forum/' . $forum->forum_name) }}">{{ $forum->forum_name }}</a>
                        </div>
                        @endforeach
                        {{ \App\Models\Forum::paginate(10)->links() }}
                    </div>
                </div>
            </div>
        </div>
    </x-app-layout>
</body>

</html>