# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".product").on "change", ->
    if $(this).val() is '1'
      $('#ArcCustomer').show()
      $('#ArcEmployee')
      $('#ArcEvent')
      $('#ArcProduct')