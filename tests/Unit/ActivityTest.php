<?php
namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Carbon;
use Tests\TestCase;

class ActivityTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function it_records_activity_when_a_thread_is_created()
    {
    	//when a user signed in and created a thread
    	$this->signIn();

    	$thread = create('App\Thread', ['user_id' => auth()->id()]);

    	//log it to activities table 
    	$this->assertDatabaseHas('activities', [
    		'type' => 'created_thread',
    		'user_id' => auth()->id(),
    		'subject_id' => $thread->id,
    		'subject_type' => 'App\Thread'
    	]);


    	$activity = \App\Activity::first();

    	$this->assertEquals($activity->subject->id, $thread->id);

    }

    /** @test */
    public function it_records_activity_when_a_reply_is_created()
    {
    	$this->signIn();

    	$reply = create('App\Reply');

    	$this->assertEquals(2, \App\Activity::count());

    }

    /** @test */
    public function it_fetches_activities_for_any_user()
    {
        // Given we have a thread
        // and another thread from a week ago
        $this->signIn();
        create('App\Thread', ['user_id' => auth()->id()], 2);        

        auth()->user()->activities()->first()->update([
            'created_at' => Carbon::now()->subWeek()
        ]);

        // when we fetch their feed
        $feed = \App\Activity::feed(auth()->user());
        // then it should be returned in the proper format

        // dd($feed);

        $this->assertTrue($feed->keys()->contains(
            Carbon::now()->format('Y-m-d')
        ));

        $this->assertTrue($feed->keys()->contains(
            Carbon::now()->subWeek()->format('Y-m-d')
        ));
    }

}