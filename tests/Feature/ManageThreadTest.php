<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ManageThreadTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function a_guest_may_not_create_a_thread()
    {
        $this->withExceptionHandling();

        $this->get('/threads/create')
             ->assertRedirect('/login');

        $this->post('/threads')
             ->assertRedirect('/login');     
    }

    /** @test */
    public function an_authenticated_user_can_create_a_thread()
    {
    	//given we have a signed-in user
    	$this->signIn();

    	// $thread = create(\App\Thread::class);
        $thread = make(\App\Thread::class);

    	//when we hit the endpoint to create a new thread
    	$response = $this->post('/threads', $thread->toArray());

    	//then, when we visit the thread page
    	//we should see the new thread
         
    	$this->get($response->headers->get('Location'))  
    		 ->assertSee($thread->title)
    		 ->assertSee($thread->body);    	
    }

    /** @test */
    public function a_thread_requires_a_title()
    {
        $this->publishThread(['title' => null])
             ->assertSessionHasErrors('title');


    }

    /** @test */
    public function a_thread_requires_a_body()
    {
        $this->publishThread(['body' => null])
             ->assertSessionHasErrors('body');


    }

    /** @test */
    public function a_thread_requires_a_valid_channel()
    {
        factory('App\Channel', 2)->create();

        $this->publishThread(['channel_id' => null])
             ->assertSessionHasErrors('channel_id');

        $this->publishThread(['channel_id' => 999])
             ->assertSessionHasErrors('channel_id');


    }

    /** @test */
    public function authorized_users_can_delete_threads()
    {
        $this->signIn();

        $thread = create('App\Thread', ['user_id' => auth()->id()]);

        $reply = create('App\Reply', ['thread_id' => $thread->id]);

        $response = $this->json('DELETE', $thread->path());

        $response->assertStatus(204);

        $this->assertDatabaseMissing('threads', ['id' => $thread->id]);
        $this->assertDatabaseMissing('replies', ['id' => $reply->id]);

        $this->assertEquals(0, \App\Activity::count());
    }


    /** @test */
    /*public function threads_may_only_be_deleted_by_those_who_have_permissions()
    {
        //to-do
    }*/

    /** @test */
    public function unauthorized_users_may_not_delete_threads()
    {
        $this->withExceptionHandling();

        $thread = create('App\Thread');

        $this->delete($thread->path())->assertRedirect('/login');

        $this->signIn();        
        $this->delete($thread->path())->assertStatus(403);
    }

    public function publishThread($overrides)
    {
        $this->withExceptionHandling()->signIn();
 
        $thread = make('App\Thread', $overrides);

        return $this->post('/threads', $thread->toArray());
    }

}
   