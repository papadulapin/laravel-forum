<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ThreadsTest extends TestCase
{
    use RefreshDatabase;
    protected $thread;
    
    public function setUp()
    {
    	Parent::setUp();
    	$this->thread = factory(\App\Thread::class)->create();
    }

    /** @test */
    public function a_user_can_view_all_threads()
    {
    	$this->get('/threads')
    		->assertSee($this->thread->title);
    }

    /** @test */
    public function a_user_can_view_a_single_thread()
    {
    	$this->get($this->thread->path())
    		 ->assertSee($this->thread->title);
    }

    /** @test */
    /*public function a_user_can_read_replies_that_are_associated_with_a_thread()
    {
    	$reply = factory(\App\Reply::class)->create(['thread_id' => $this->thread->id]);
    	$this->get($this->thread->path())
    		->assertSee($reply->body);
    }*/

    /** @test */
    public function a_user_can_filter_threads_accoring_to_a_channel()
    {
        $channel = create('App\Channel');
        $threadInChannel = create('App\Thread', ['channel_id' => $channel->id]);
        $threadNotInChannel = create('App\Thread');

        $this->get('/threads/' . $channel->slug)
             ->assertSee($threadInChannel->title)
             ->assertDontSee($threadNotInChannel->title);
    }

    /** @test */
    public function a_user_can_filter_threads_by_any_username()
    {
        $this->signIn(create('App\User', ['name' => 'Myself']));

        $threadByMyself = create('App\Thread', ['user_id' => auth()->id()]);
        $threadNotByMyself = create('App\Thread');

        $this->get('/threads?by=Myself')
             ->assertSee($threadByMyself->title)
             ->assertDontSee($threadNotByMyself->title);
    }

    /** @test */
    public function a_user_can_filter_threads_by_popularity()
    {
        //given we have three threads
        //with 2 replies, 3 replies and 0 replies respectively
        $threadWith2Replies = create('App\Thread');
        create('App\Reply', ['thread_id' => $threadWith2Replies->id], 2);

        $threadWith3Replies = create('App\Thread');
        create('App\Reply', ['thread_id' => $threadWith3Replies->id], 3);

        $threadWith0Replies = $this->thread;

        // when filtering all threads by popularity
        $response = $this->getJson('/threads?popular=1')->json();

        // dd($response);
        // dd(array_column($response, 'replies_count'));

        //then they should be returned from most replies to least
        $this->assertEquals([3,2,0], array_column($response, 'replies_count'));
    }

    /** @test */
    public function a_user_can_request_all_replies_for_a_given_thread()
    {
        $thread = create('App\Thread');
        $replies = create('App\Reply', ['thread_id' => $thread->id], 2);

        $response = $this->getJson($thread->path() . '/replies')->json();

        // dd($response);
        // $this->assertCount(1, $response['data']);
        $this->assertEquals(2, $response['total']);
    }

    /** @test */
    public function a_user_can_filter_threads_by_those_that_are_unanswered()
    {
        $thread = create('App\Thread');
        $reply = create('App\Reply', ['thread_id' => $thread->id]);

        $response = $this->getJson('threads?unanswered=1')->json();
        // dd($response);
        $this->assertCount(1, $response);
    }
}
