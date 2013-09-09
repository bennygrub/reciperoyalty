# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".tab").click ->
    $(".closed_view").toggle()

  $(".tab").click ->
    $(".open_view").toggle()

	
$ ->
  $("#showdiv1").click ->
    $("div[id^=div]").hide()
    $("#div1").show()

  $("#showdiv2").click ->
    $("div[id^=div]").hide()
    $("#div2").show()

  $("#showdiv3").click ->
    $("div[id^=div]").hide()
    $("#div3").show()

  $("#showdiv4").click ->
    $("div[id^=div]").hide()
    $("#div4").show()

  $("#showdiv5").click ->
    $("div[id^=div]").hide()
    $("#div4").show()

  $("#showdiv6").click ->
    $("div[id^=div]").hide()
    $("#div4").show()



$("#tabber-container").easytabs()