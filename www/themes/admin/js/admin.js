$(document).ready(function()
{
	$("#submenu ul ul").hide(); // Hide all sub menus
	$("#submenu > ul > li.active").find("ul").slideToggle("slow");
//	$("#submenu > ul > li > a").click( // When a top menu item is clicked...
//			function () {
//				$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
//				$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
//				return false;
//			}
//		);

		$("#main-nav li a.no-submenu").click( // When a menu item with no sub menu is clicked...
			function () {
				window.location.href=(this.href); // Just open the link instead of a sub menu
				return false;
			}
		);
	$("#submenu > ul > li > a").hover(
			function () {
				$(this).stop().animate({paddingRight: "25px"}, 150);
			},
			function () {
				$(this).stop().animate({paddingRight: "10px"}, 150);
			}
		);
	//slide("#submenu", 15, 0, 150, .8);



//	$("legend").html('<a href="#">'+$("legend").html()+'</a>');
//	$("fieldset").children().not("legend").slideToggle("slow", function() {
//
//	});

	$("fieldset.collapsed").children().not("legend").children().hide();
	$("legend").live("click", function(){
		$(this).parent().children().not("legend").children().toggle("fast", function() {
			
		});
		if($(this).parent().hasClass("collapsed")) $(this).parent().removeClass("collapsed");
		else $(this).parent().addClass("collapsed");
	})


});
