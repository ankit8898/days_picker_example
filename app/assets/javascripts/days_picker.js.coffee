# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log 'hee'
  getDates = ->
  $.ajax
    url: $(this).attr("data-url")
    data:
      year: $(".years").val()

    dataType: "script"
   
   $(".years").change(getDates).trigger "change"
