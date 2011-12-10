<?php

/**
 * Venne:CMS (version 2.0-dev released on $WCDATE$)
 *
 * Copyright (c) 2011 Josef Kříž pepakriz@gmail.com
 *
 * For the full copyright and license information, please view
 * the file license.txt that was distributed with this source code.
 */

namespace VenneTheme;

/**
 * @author Josef Kříž
 */
class Theme extends \Venne\Templating\Theme {


	public function getName()
	{
		return "Venne";
	}


	public function getDescription()
	{
		return "Default Venne:CMS website";
	}


	public function getVersion()
	{
		return "2";
	}

}
