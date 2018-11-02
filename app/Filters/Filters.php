<?php

namespace App\Filters;

use Illuminate\Http\Request;

abstract class Filters
{
	protected $request;
	protected $builder;

	protected $filters = [];

	/** 
	 * Constructor 
	 * @param  Request $request
	 * 
	 */
	public function __construct(Request $request)
	{
		$this->request = $request;
	}

	/** 
	 * @param $builder
	 * @return $builder
	 */
	public function apply($builder)
	{
		$this->builder = $builder;

		foreach ($this->getFilters() as $filter => $value) {

		// dump( $filter . ' : ' . $value);

			if (method_exists($this, $filter)) {
				$this->$filter($value);
			} 
		}

		// if ($this->request->has('by')) {
		// 	$this->by($this->request->by);
		// }

		return $this->builder;
	}

	public function getFilters()
	{
		return $this->request->only($this->filters);
	}	
}