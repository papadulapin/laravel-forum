<?php

namespace App;

use App\Favorite;
use App\Thread;
use App\Traits\Favoriteable;
use App\Traits\RecordsActivity;
use App\User;
use Illuminate\Database\Eloquent\Model;

class Reply extends Model
{
    use Favoriteable, RecordsActivity;

    protected $guarded = [];

    protected $appends = ['favoritesCount', 'isFavorited'];

   //eager load with user(), favorites()
   // or via global scope see below in boot method
   // protected $with = ['user', 'favorites'];
    
    protected static function boot() 
    {
        parent::boot();

        // eager load via global scope
        // and switch it off if needed by using withoutGlobalScopes()
        static::addGlobalScope('user', function ($builder) {
            $builder->with('user');
        });

        static::addGlobalScope('favorites', function ($builder) {
            $builder->with('favorites');
        });

        //model event
        static::deleting(function ($reply) {
           $reply->thread->decrement('replies_count');
        });

        static::creating(function ($reply) {
            $reply->thread->increment('replies_count');
        });
    }

    public function user()
    {
    	return $this->belongsTo(User::class);
    }

    public function thread()
    {
        return $this->belongsTo(Thread::class);
    }

    public function path()
    {
        return $this->thread->path() . "#reply-{$this->id}";
    }

    // public function favorited()
    // {
    //     return $this->morphMany('App\Favorite', 'favorited');
    // }
}
