<?php

namespace App\Filters;

use App\Filters\Filters;
use App\User;
use Illuminate\Http\Request;

class ThreadFilters extends Filters
{
	protected $filters = ['by', 'popular', 'unanswered'];
	/** 
	 * @param $username
	 * @return $builder
	 */
	protected function by($username)
	{
        $user = User::where('name', $username)->firstOrFail();
            
        return $this->builder->where('user_id', $user->id);
	}

	/** 
	 * 
	 * @return $this
	 */
	protected function popular()
	{
		$this->builder->getQuery()->orders = [];
		
		return $this->builder->orderBy('replies_count', 'desc');
	}

    protected function unanswered()
    {
        return $this->builder->where('replies_count', 0);
    }
}