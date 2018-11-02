<reply :attributes="{{ $reply }}" inline-template v-cloak>

    <div class="">

        <div id="reply-{{ $reply->id }}" class="card">
           
           <div class="card-header">

                <div class="level">

                    <strong class="flex">
                        <a href="{{ route('profile.show', $reply->user) }}">
                            {{ $reply->user->name }}
                        </a> said {{ $reply->created_at->diffForHumans() }}:
                    </strong>

                    @if(Auth::check())
                    <div>
                        <favorite :reply="{{ $reply }}"></favorite>
                    </div>
                    @endif
                    
                    {{-- <form method="POST" action="/replies/{{ $reply->id }}/favorites">
                        @csrf
                        <button type="submit" class="btn btn-default" {{ $reply->isFavorited() ? 'disabled' : '' }}>{{ $reply->favorites_count }} {{ str_plural('Favorite', $reply->favorites_count) }}</button>

                    </form> --}}

                </div>



            </div>

            <div class="card-body">

                <div v-if="editing">
                    <div class="form-group">
                        
                        <textarea class="form-control" v-model="body"></textarea>
                    </div>

                    <button class="btn btn-xs btn-primary" @click="update">Update</button>
                    <button class="btn btn-xs btn-link" @click="editing = false">Cancel</button>
                </div>

                <div v-else v-text="body"></div>                 

            </div>

            @can ('update', $reply)

                <div class="card-footer level">

                    <button class="btn btn-xs mr-1" @click="editing = true">Edit</button>
                    <button class="btn btn-danger btn-xs mr-1" @click="destroy">Delete</button>

                    {{-- <form method="POST" action="/replies/{{ $reply->id }}">
                        @csrf
                        {{ method_field('DELETE') }}
                        <button type="submit" class="btn btn-danger btn-xs">Delete</button>

                    </form> --}}

                </div>

            @endcan

        </div><br>
        
    </div>

</reply>