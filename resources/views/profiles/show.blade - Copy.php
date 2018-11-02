 @extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        

        <div class="col-md-8">
        	<h1>{{ $profileUser->name }}</h1>
        	<hr>
            @foreach ($threads as $thread)
            <div class="card">
                <div class="card-header">
                	<div class="level">
                          <h2 class="flex"><a href="{{ $thread->path() }}">{{ $thread->title }}</a>  <span style="font-size:1rem;"><br>posted by <a href="{{ route('profile.show', $thread->user) }}">{{ $thread->user->name }}</a> {{ $thread->created_at->diffForHumans() }}</span></h2>
                          <a href="{{ $thread->path() }}"><strong>{{ $thread->replies_count }} {{ str_plural('reply', $thread->replies_count) }}</strong></a>

                      </div>	

                </div>

                <div class="card-body">
                   	<article>  
                   		<div class="body">{{ $thread->body }}</div>
                   	</article>

                   {{-- {{ $threads->appends(request()->query())->links() }} --}}
                </div>
            </div><br>
            @endforeach

                   <br>{{ $threads->links() }}

        </div>


        {{--  <div class="col-md-4">
          <div class="card">
              <div class="card-header">SIDEBAR</div>

              <div class="card-body">
               <small>A memeber since {{ $profileUser->created_at->diffForHumans() }}</small>
              </div>
          </div>
        </div> --}}


    </div>
</div>
@endsection

