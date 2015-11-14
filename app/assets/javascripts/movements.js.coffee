# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#btnAddMovement").click(()->
    $("#new_movementsdetail")[0].reset()

    hdnId = $("#new_movementsdetail .Id")
    index = $("#tblMovements tbody tr:last-child").attr("data-index")
    index = -1 if index == undefined

    hdnId.val(parseInt(index) + 1)
    $("#myModalLabel").text("Nuevo Movimiento")
    $('#modalMovementDetail').modal('show')
    false
  )

  $("#btnSaveMovement").click(()->
    $("div[data-valuetype]").each(() ->
      drp = $(this).find("select")[0]
      $(this).find("input:hidden").val(drp.options[drp.selectedIndex].innerHTML)
      $("#modalMovementDetail form :submit").click()
      true
    )
    false
  )

  $("#new_movementsdetail")
  .on("ajax:success", (e, data, status, xhr) ->
    Id = $("#new_movementsdetail .Id").val()
    if($("#tblMovements tbody tr[data-index=" + Id + "]").length == 0)
      $("#tblMovements tbody").append xhr.responseText
    else
      $("#tblMovements tbody tr[data-index=" + Id + "]").replaceWith xhr.responseText
    $('#modalMovementDetail').modal('hide')
    true
  ).on("ajax:error", (e, xhr, status, error) ->
    alert(error)
    true
  )

  $("#divEntityType select").change(() ->
    entityReference = $("#divEntityReference input")
    if(this.value == "1")
      entityReference.autocomplete({
        source: "/jmembers.json",
        minLength: 2
      })
    else if(entityReference.hasClass("ui-autocomplete-input"))
      entityReference.autocomplete("destroy").removeData("autocomplete")
    true
  )
  true

@deleteDetail = (btn) ->
  $(btn).parent().parent().remove()
  false

@editDetail = (btn) ->
  tr = $(btn).parent().parent()
  tr.find("input[class]").each(() ->
    $("#movementsdetail_" + this.className).val(this.value)
    true
  )
  $("#myModalLabel").text("Editar Movimiento")
  $('#modalMovementDetail').modal('show')
false