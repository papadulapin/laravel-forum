<?php

use Faker\Generator as Faker;

$factory->define(App\Reply::class, function (Faker $faker) {
    return [
        'body'	 	=> $faker->paragraph(rand(3,5)),
        'thread_id' 	=> function () {
        	return factory(\App\Thread::class)->create()->id;
        },
        'user_id' 	=> function () {
        	return factory(\App\User::class)->create()->id;
        },
    ];
});
