# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$(".tab").click ->
		$(".open_view").animate
			bottom: "550px"
			, 2000
		$("#main_recipe").animate
			height: "700px"
			, 2000
		$(".recipe_footer").show()
		$(".tab").hide()
		$(".close_tab").show()
		$(".challenger_bar").fadeOut(500)


$ ->
	$(".close_tab").click ->
		$(".open_view").animate
			bottom: "-26px"
			, 3000
		$(".recipe_footer").hide()
		$(".tab").show()
		$(".close_tab").hide()
		$(".challenger_bar").fadeIn(2000)

$ ->
  $(".scrollable-area").slimScroll
  	height: "495px"
  	color: "#fff"
  	alwaysVisible: "true"

$ ->
	$(".already_loved").click ->
		alert "You Already Loved This Recipe! It must be really great. We will take note."

$ ->
	$(".before_comment").click ->
		$(".before_comment").hide()
		$(".comment_area").show()

$ ->
	$('a.fancybox').fancybox()


$(document).ready ->
  $(".various").fancybox
    maxWidth: 800
    maxHeight: 600
    fitToView: false
    width: "70%"
    height: "70%"
    autoSize: false
    closeClick: false
    openEffect: "none"
    closeEffect: "none"