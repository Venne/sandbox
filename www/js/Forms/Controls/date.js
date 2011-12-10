$(function() {

	
	var basePath = jQuery.venne.getBasePath();
		
	$('head').append('<link rel="stylesheet" href="' + basePath + '/css/Forms/Controls/dateInput.css" type="text/css" />');
	$.getScript(basePath + '/js/jquery-ui-timepicker-addon.js', function(data, textStatus){
		$.getScript(basePath + '/js/Forms/Controls/dateInput.js', function(data, textStatus){
			$('input[data-dateinput-type]').dateinput({
				datetime: {
					dateFormat: 'd.m.yy',
					timeFormat: 'h:mm'
				},
				'datetime-local': {
					dateFormat: 'd.m.yy',
					timeFormat: 'h:mm'
				},
				date: {
					dateFormat: 'd.m.yy'
				},
				month: {
					dateFormat: 'MM yy'
				},
				week: {
					dateFormat: "w. 'týden' yy"
				},
				time: {
					timeFormat: 'h:mm'
				}
			});	
		});
	});
});