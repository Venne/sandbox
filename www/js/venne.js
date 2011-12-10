/**
 * Venne:CMS (version 2.0-dev released on $WCDATE$)
 *
 * Copyright (c) 2011 Josef Kříž pepakriz@gmail.com
 *
 * For the full copyright and license information, please view
 * the file license.txt that was distributed with this source code.
 */

jQuery.extend({
	venne: {
		getBasePath: function(){
			return $("body").attr("data-venne-basepath");
		}
	}
});

$(function() {
	$.fn.extend({
		triggerAndReturn: function (name, data) {
			var event = new $.Event(name);
			this.trigger(event, data);
			return event.result !== false;
		}
	});
	
	$("a.ajax").live("click", function (event) {
		event.preventDefault();
		$.get(this.href);
	});
	
	$("form.ajax").live("submit", function () {
		$(this).ajaxSubmit();
		return false;
	});

	// odeslání pomocí tlačítek
	$("form.ajax :submit").live("click", function () {
		$(this).ajaxSubmit();
		return false;
	});

	$('a[data-confirm], button[data-confirm], input[data-confirm]').live('click', function (e) {
		var el = $(this);
		if (el.triggerAndReturn('confirm')) {
			if (!confirm(el.attr('data-confirm'))) {
				e.preventDefault();
				e.stopImmediatePropagation();
				return false;
			}
		}
	});
	
	$("div.dialog").dialog();
	
	$("div[data-venne-ui-dialog]").each(function(){
		var args = jQuery.parseJSON($(this).attr("data-venne-ui-dialog").replace(/\'/g, '"'));

		if(typeof(args.label) == "undefined"){
			args.label = "Ok";
		}
		
		if(typeof(args.modal) == "undefined"){
			args.modal = false;
		}
		
		if(typeof(args.resizable) == "undefined"){
			args.resizable = false;
		}
		
		if(typeof(args.link) == "undefined"){
			args.link = "#";
		}
		
		if(args.type == "confirm"){
			$(this).dialog({
				resizable: args.resizable,
				modal: args.modal,
				buttons: {
					confirm: {
						text: args.label,
						click: function(){
							window.location = args.link;
						}
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				}
			});
		}else{
			$(this).dialog({
				resizable: args.resizable,
				modal: args.modal
			});
		}
	});

});


