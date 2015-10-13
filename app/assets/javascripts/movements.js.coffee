# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#btnSaveMovement").click(()->
    $("div[data-valuetype]").each(() ->
      drp = $(this).find("select")[0]
      $(this).find("input:hidden").val(drp.options[drp.selectedIndex].innerHTML)
      true
    )
  )
  $("#new_movementsdetail")
  .on("ajax:success", (e, data, status, xhr) ->
    $("#tblMovements tbody").append xhr.responseText
    $(".divDialog").dialog("close")
    true
  ).on("ajax:error", (e, xhr, status, error) ->
    alert(error)
    true
  )
  true

@deleteDetail = (movementDetail) ->
  $(movementDetail).parent().parent().remove()
  false
