<?php

namespace App\Traits;

use App\Favorite;

trait Favoriteable
{
    //model events
    protected static function bootFavoriteable()
    {
        if (auth()->guest()) {
            return;
        }

        static::deleting(function ($model) {
            $model->favorites->each->delete();
        });
    }  

    public function favorites()
    {
        return $this->morphMany(Favorite::class, 'favorited');
    }

    public function favorite()
    {        
        $attributes = ['user_id' => auth()->id()];

        if ( !$this->favorites()->where($attributes)->exists() ) {
            return $this->favorites()->create($attributes);	
        }
    }

    public function unfavorite()
    {        
        $attributes = ['user_id' => auth()->id()];

        /*$this->favorites()
            ->where($attributes)
            ->get()
            ->each(function ($favorite) {
                $favorite->delete();
            });
        */
        $this->favorites()
            ->where($attributes)
            ->get()
            ->each
            ->delete();

    }

    public function getIsFavoritedAttribute()
    {
        return $this->isFavorited();
    }

    public function isFavorited()
    {
        return (bool) $this->favorites->where('user_id', auth()->id())->count();
    }

    public function getFavoritesCountAttribute()
    {
        return $this->favorites->count();
    }
}