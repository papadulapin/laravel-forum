@extends('layouts.app')

@section('content')
<div class="container">
   <div class="row justify-content-center">
        <div class="col-8">
            <div class="card">
                <div class="card-header"><h1>Create a New Thread</h1></div>

                <div class="card-body">
                  
                   <form method="POST" action="{{ route('thread.store') }}">
        
                      <div class="form-group">
                        <label for="title" class="font-weight-bold">Title</label>
                        <input type="text" name="title" id="title" placeholder="Title" class="form-control" value="{{ old('title') }}" required>
                      </div>

                       <div class="form-group">
                        <label for="channel_id" class="font-weight-bold">Channel</label>
                        <select type="text" name="channel_id" id="channel_id" class="form-control" required>
                          <option value="">Choose a Channel</option>
                          @foreach ($channels as $channel)
                            <option value="{{ $channel->id }}" {{ old('channel_id') == $channel->id ? 'selected' : '' }}>
                              {{ $channel->name }}
                            </option>
                          @endforeach
                       </select>   
                      </div>

                      <div class="form-group">
                      <label for="body" class="font-weight-bold">Description</label>
                      <textarea rows="8" name="body" id="body" placeholder="Description" class="form-control" required>{{ old('body') }}</textarea>
                    </div>

                    @csrf
                    <div class="form-group">
                    <button type="submit" class="btn btn-primary">Publish</button>
                  </div>
                    </form>

                    @if (count($errors))
                      <ul class="alert alert-danger">
                        @foreach ($errors->all() as $error)
                         <li>{{ $error }}</li>
                         @endforeach
                      </ul>
                    @endif


                </div>
            </div>
        </div>
    </div>
</div>
@endsection
