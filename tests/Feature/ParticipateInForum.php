<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ParticipateInForum extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function unauthenticated_user_may_not_add_replies()
    {
        $this->withExceptionHandling()
             ->post('/threads/test/1/replies',[])
             ->assertRedirect('/login');
    }

    /** @test */
    public function an_authenticated_user_can_participate_in_forum_threads()
    {
        $this->signIn();

    	$thread = create('App\Thread');

    	$reply = create('App\Reply');

        // dd('debug');
    	
        $this->post($thread->path() . '/replies', $reply->toArray());

    	// $this->get($thread->path())
    	// 	 ->assertSee($reply->body);

        // $this->assertDatabaseHas('replies', ['body' => $reply->body]);

        $this->assertEquals(1, $thread->fresh()->replies_count);
    }

    /** @test */
    public function a_reply_requires_a_body()
    {
        $this->withExceptionHandling()->signIn();
            
        $thread = create('App\Thread');

        $reply = make('App\Reply', ['body' => null]);    

        $this->post($thread->path() . '/replies', $reply->toArray())
             ->assertSessionHasErrors('body');

    }

    /** @test */
    public function unauthorized_users_cannot_delete_replies()
    {
        $this->withExceptionHandling();

        $reply = create('App\Reply');

        $this->delete("/replies/{$reply->id}")
            ->assertRedirect('/login');

        $this->signIn()
            ->delete("/replies/{$reply->id}")
            ->assertStatus(403);
    }

    /** @test */
    public function authorized_users_can_delete_replies()
    {
        $this->signIn();

        $reply = create('App\Reply', ['user_id' => auth()->id()]);

        $this->delete("/replies/{$reply->id}")
            ->assertStatus(302);

        $this->assertEquals(0, $reply->thread->fresh()->replies_count);
        
        $this->assertDatabaseMissing('replies', ['id' => $reply->id]);
    }

    /** @test */
    public function authorized_users_can_update_replies()
    {
        $this->signIn();

        $reply = create('App\Reply', ['user_id' => auth()->id()]);

        $body = 'Updated body text';

        $this->patch("/replies/{$reply->id}", [
            'body' => $body
        ]);

        $this->assertDatabaseHas('replies', [
            'id' => $reply->id,
            'body' => $body
        ]);
    }

     /** @test */
    public function unauthorized_users_cannot_update_replies()
    {
        $this->withExceptionHandling();

        $reply = create('App\Reply');

        $this->patch("/replies/{$reply->id}")
            ->assertRedirect('/login');

        $this->signIn()
            ->patch("/replies/{$reply->id}")
            ->assertStatus(403);
    }
}
    