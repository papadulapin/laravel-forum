<nav class="navbar navbar-expand-md navbar-light navbar-laravel">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                        <li class="nav-item">
                            <div class="dropdown">
                                  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   Browse
                                  </a>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                                    <a class="nav-link" href="{{ route('thread.index') }}">{{ __('All Threads') }}</a>

                                    @if (auth()->check())
                                     <a class="nav-link" href="{{ route('thread.index') }}/?by={{ auth()->user()->name }}">{{ __('My Threads') }}</a>
                                     @endif

                                      <a class="nav-link" href="{{ route('thread.index') }}/?popular=1">{{ __('Popular Threads') }}</a>
                                      <a class="nav-link" href="{{ route('thread.index') }}/?unanswered=1">{{ __('Unanswered Threads') }}</a>
                                  </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('thread.create') }}">{{ __('New Thread') }}</a>
                        </li>

                        <li class="nav-item">
                            <div class="dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Channels
                          </a>

                          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                            @foreach ($channels as $channel)
                                <a class="dropdown-item" href="/threads/{{ $channel->slug }}">{{ $channel->name }}</a>
                            @endforeach

                          </div>


                        </div>


                        </li>


                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            <li class="nav-item">
                                @if (Route::has('register'))
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                @endif
                            </li>
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                                    <a class="dropdown-item" href="{{ route('profile.show', auth()->user()) }}">
                                        {{ __('Profile') }}
                                    </a>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>

                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>