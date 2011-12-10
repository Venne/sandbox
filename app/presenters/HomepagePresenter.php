<?php

/**
 * Venne:CMS (version 2.0-dev released on $WCDATE$)
 *
 * Copyright (c) 2011 Josef Kříž pepakriz@gmail.com
 *
 * For the full copyright and license information, please view
 * the file license.txt that was distributed with this source code.
 */

namespace App;

use Venne\Application\UI\FrontPresenter;

/**
 * @author     Josef Kříž
 * 
 * @property-read \Nette\Application\Container $container
 */
class HomepagePresenter extends FrontPresenter {



	public function renderDefault()
	{
		$this->template->anyVariable = 'any value';
	}

}