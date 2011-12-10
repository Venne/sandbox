jQuery(document).ready(function() {
	if($('textarea[data-venne-form-editor]').length){
		var basePath = jQuery.venne.getBasePath();
		
		$('head').append('<link rel="stylesheet" href="' + basePath + '/elrte/css/elrte.min.css" type="text/css" />');
		$('head').append('<link rel="stylesheet" href="' + basePath + '/elrte/css/elrte-inner.css" type="text/css" />');
		$('head').append('<link rel="stylesheet" href="' + basePath + '/elfinder/css/elfinder.css" type="text/css" />');
		$.getScript(basePath + '/elrte/js/elrte.min.js', function(data, textStatus){
			$.getScript(basePath + '/elfinder/js/elfinder.min.js', function(data, textStatus){
				$('textarea[data-venne-form-editor]').each(function(){
					$(this).elrte(
					{
						absoluteURLs: false,
						cssClass : 'el-rte',
						lang     : 'cs',
						styleWithCSS: true,
						height   : 600,
						toolbar  : 'maxi',
						cssfiles : ['http://elrte.org/release/elrte/css/elrte-inner.css'],
						fmOpen : function(callback) {
							$('<div id="myelfinder" />').elfinder({
								url : basePath + '/elfinder/connectors/php/connector.php',
								lang : 'cs',
								dialog : {
									width : 900, 
									modal : true, 
									title : 'Files'
								}, // open in dialog window
								closeOnEditorCallback : true, // close after file select
								editorCallback : callback     // pass callback to file manager
							})
						}
					});
				});
			});
		});
	}
});