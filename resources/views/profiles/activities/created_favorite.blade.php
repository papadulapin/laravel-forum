@if ($activity->subject->favorited)
    @component('profiles.activities.activity')

        @slot('heading')
            {{ $profileUser->name}} favorited a <a href="{{ $activity->subject->favorited->path() }}">reply</a>. 
            {{-- published <a href="{{ $activity->subject->path() }}">{{ $activity->subject->title }}</a>. --}}
        @endslot

        @slot('body')
            {{ $activity->subject->favorited->body }}
        @endslot

    @endcomponent
@endif
