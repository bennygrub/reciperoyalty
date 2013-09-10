# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".tab").click ->
    $(".closed_view").toggle()

  $(".tab").click ->
    $(".open_view").toggle()


$ ->
  $(".scrollable-area").slimScroll
  	height: "495px"
  	color: "#fff"
  	alwaysVisible: "true"