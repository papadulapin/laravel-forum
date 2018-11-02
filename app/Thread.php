<?php

namespace App;

use App\Channel;
use App\Reply;
use App\Traits\RecordsActivity;
use App\User;
use Illuminate\Database\Eloquent\Model;

class Thread extends Model
{
    use RecordsActivity;

    protected $guarded = [];
    
    // eager load with user(), channel()
    // or via global scope see below in boot method
    // protected $with = ['user', 'channel'];

    protected static function boot()
    {
        parent::boot();

        // eager load via global scope
        // and switch it off if needed by using withoutGlobalScopes()
        static::addGlobalScope('user', function ($builder) {
            $builder->with('user');
        });

        static::addGlobalScope('channel', function ($builder) {
            $builder->with('channel');
        });

        /*static::addGlobalScope('replyCount', function ($builder) {
            $builder->withCount('replies');
        });*/

        //model event
        static::deleting(function ($thread) {
            $thread->replies->each->delete();
            /*$thread->replies->each(function ($reply) {
                $reply->delete();
            });*/
        });

    }

    public function path()
    {
        return "/threads/{$this->channel->slug}/{$this->id}";
    }
    public function replies()
    {
    	/*
        $tmp = $this->hasMany(Reply::class)->withCount('favorites')->get();
        dd($tmp);
        */
 
        //the part, withCount('favorites'), is derived from favorites() in reply.php
        // return $this->hasMany(Reply::class)
        //         ->withCount('favorites');

        return $this->hasMany(Reply::class);
        
    }

    public function user()
    {
    	return $this->belongsTo(User::class);
    }

    public function channel()
    {
        return $this->belongsTo(Channel::class);
    }

    public function addReply($reply)
    {
    	return $this->replies()->create($reply);
    }

    public function scopeFilter($query, $filters)
    {
        return $filters->apply($query);
    }
}
 