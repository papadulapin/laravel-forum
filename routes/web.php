<?php

Auth::routes();
Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/threads', 'ThreadController@index')->name('thread.index');
Route::get('/threads/create', 'ThreadController@create')->name('thread.create');
Route::get('/threads/{channel}/{thread}', 'ThreadController@show')->name('thread.show');

Route::delete('/threads/{channel}/{thread}', 'ThreadController@destroy')->name('thread.delete');
Route::get('/threads/{channel}', 'ThreadController@index');

Route::post('/threads', 'ThreadController@store')->name('thread.store');
Route::post('/threads/{channel}/{thread}/replies', 'ReplyController@store')->name('reply.store');


Route::get('/threads/{channel}/{thread}/replies', 'ReplyController@index')->name('reply.index');

Route::delete('/replies/{reply}', 'ReplyController@destroy')->name('reply.destroy');
Route::patch('/replies/{reply}', 'ReplyController@update')->name('reply.update');

Route::post('/replies/{reply}/favorites', 'FavoriteController@store');
Route::delete('/replies/{reply}/favorites', 'FavoriteController@destroy');

Route::get('/profiles/{user}', 'ProfileController@show')->name('profile.show');

