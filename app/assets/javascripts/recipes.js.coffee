# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$(".tab").click ->
		$(".open_view").animate
			bottom: "550px"
		$(".recipe_footer").show()
		$(".tab").hide()
		$(".close_tab").show()


$ ->
	$(".close_tab").click ->
		$(".open_view").animate
			bottom: "-26px"
		$(".recipe_footer").hide()
		$(".tab").show()
		$(".close_tab").hide()

$ ->
  $(".scrollable-area").slimScroll
  	height: "495px"
  	color: "#fff"
  	alwaysVisible: "true"