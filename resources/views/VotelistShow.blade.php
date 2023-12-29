@include('layouts.navigation')  <!-- 引入導引列 -->
<!-- 引入各個模型 -->
@php    
    use App\Models\Vote;
    use App\Models\voting_record;
    use Illuminate\Support\Facades\Auth;
@endphp
<x-app-layout>
    <x-slot name="header"> <!-- 顯示頁面主題 -->
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            投票清單
        </h2>
    </x-slot>
    @foreach (Vote::all() as $vote)
    <div class="py-1">   <!-- 顯示投票清單 -->
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h1 class = "text-xl">{{$vote->Title}}</h1>   <!-- 顯示投票標題 -->
                    <br>
                    <div class = "flex">
                        <p class = "flex-1">{{$vote->Content}}</p>  <!-- 顯示投票內容 -->
                        <p class = "flex-1">{{$vote->Total_vote}}</p>   <!-- 顯示總票數 -->
                        <p class = "flex-1">{{$vote->Result}}</p>   <!-- 顯示投票結果 -->
                        <!-- 搜尋投票紀錄以決定要顯示以投票還是未投票 -->
                        @php  
                          $voteid = $vote->id;
                          $voteRecords = voting_record::Where('vote_id','=',$voteid)->first();                          
                        @endphp

                        <!-- 查詢是否已投票 -->
                        @if($voteRecords  && $voteRecords->members_id == Auth::user()->id) 
                            <x-primary-button>已投票</x-primary-button>                        
                        @else
                            <form method="POST" action="{{route('Vote.update')}}">
                                @csrf
                                @method('patch')
                                <input type="hidden" name="VoteID" value="{{ $vote->id }}">
                                <x-primary-button>投票</x-primary-button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>         
    @endforeach   
</x-app-layout>