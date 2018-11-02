<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class FavoritesTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function guests_cannot_favorite_anything()
    {
    	$reply = create('App\Reply');

    	$this->withExceptionHandling()
    		 ->post('/replies/' . $reply->id . '/favorites')
    		 ->assertRedirect('/login');
    }

    /** @test */
    public function an_authenticated_user_can_favor_any_reply()
    {
    	$this->signIn();

    	$reply = create('App\Reply');
    	//when posted to a favorite endpoint
    	// /replies/id/favorites
    	$this->withExceptionHandling()
    		 ->post('/replies/' . $reply->id . '/favorites');

    	// it should be recorded in the database
    	$this->assertCount(1, $reply->favorites);
    }

    /** @test */
    public function an_authenticated_user_can_favor_a_reply_only_once()
    {
    	$this->signIn();

    	$reply = create('App\Reply');
    	//when posted to a favorite endpoint
    	// /replies/id/favorites
    	
    	try {
    		$this->withExceptionHandling()
    		 ->post('/replies/' . $reply->id . '/favorites');
    		$this->withExceptionHandling()
    		 ->post('/replies/' . $reply->id . '/favorites');
    	} catch (\Exception $e) {
    		$this->fail('Did not expect to inser the same record set twice.');
    	}

    	// dd(\App\Favorite::all()->toArray());

    	// it should be recorded in the database
    	$this->assertCount(1, $reply->favorites);
    }

    /** @test */
    public function an_authenticated_user_can_unfavor_a_reply()
    {
        $this->signIn();

        $reply = create('App\Reply');

        $this->withExceptionHandling();

        $reply->favorite();

        // $this->delete('/replies/' . $reply->id . '/favorites');
        $reply->unfavorite();

        $this->assertCount(0, $reply->favorites);
    }

}