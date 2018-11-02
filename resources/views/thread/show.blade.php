@extends('layouts.app')

@section('content')
<thread-view :initial-replies-count="{{ $thread->replies_count }}" inline-template>

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-md-8">

                <div class="card">

                    <div class="card-header">

                        <div class="level">
                            <span class="flex">
                                <h1>{{ $thread->title }}</h1> 
                                Posted by <a href="{{ route('profile.show', $thread->user) }}">{{ $thread->user->name }}</a> {{ $thread->created_at->diffForHumans() }}
                            </span>

                            @can('update', $thread)
                            <form method="POST" action="{{ route('thread.delete', [$thread->channel, $thread]) }}">
                                @csrf
                                {{ method_field('DELETE') }}
                                <button class="btn btn-link">Delete Thread</button>
                            </form>
                            @endcan

                        </div>

                    </div>

                    <div class="card-body">
                        <div class="body">{{ $thread->body }}</div>
                    </div>

                </div><br>

                <replies 
                    {{-- :data="{{ $thread->replies }}"  --}}
                    @added="repliesCount++"
                    @removed="repliesCount--"></replies>

                {{-- @foreach ($replies as $reply)    
                @include ('thread.reply')    
                @endforeach
                --}}
                
                {{-- DEBUG: INSERT COMMENT BOX BELOW
                {{ $replies->links() }} --}}

               {{--  @if (auth()->check())
                <form method="POST" action="{{ $thread->path() }}/replies">

                    <div class="form-group">
                        <label class="font-weight-bold">Have something to say?</label>
                        <textarea rows="8" name="body" id="body" placeholder="Comment" class="form-control"></textarea>
                    </div>

                    @csrf
                    <button type="submit" class="btn btn-primary">Post</button>

                </form>
                @else
                <p class="text-center">Please <a href="{{ route('login') }}">sign in</a> to participate in this discussion.</p>
                @endif --}}

            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">Details</div>

                    <div class="card-body">
                        This thread was published {{ $thread->created_at->diffForHumans() }} by <a href="#">{{ $thread->user->name }}</a>, and currently has <span v-text="repliesCount"></span> {{ str_plural('comment', $thread->replies_count) }}.
                    </div>
                </div>
            </div>

        </div>

    </div>

</thread-view>
@endsection
