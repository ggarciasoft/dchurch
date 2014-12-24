# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

createDropDown = (name, lst) ->
  drp = document.createElement("SELECT")
  drp.setAttribute("name", name)
  for item in lst
    option = document.createElement("OPTION")
    option.text = item[0]
    option.value = item[1]
    drp.appendChild(option)
  drp

@addMinistry = () ->
  lstRows = document.querySelectorAll("#tblMinistries tbody tr")
  lastRow = lstRows[lstRows.length - 1]
  rowId = 0
  rowId = parseInt(lastRow.getAttribute("data-index")) + 1 if lastRow?
  tblMinistries = document.querySelector("#tblMinistries tbody")
  row = tblMinistries.insertRow()
  row.setAttribute("data-index", rowId)
  column1 = row.insertCell(0)
  column2 = row.insertCell(1)
  column3 = row.insertCell(2)

  column1.appendChild(createDropDown("member[memberministrypositions_attributes][{0}][ministry_id]".replace("{0}",
      rowId),
    JSON.parse(document.getElementById("hdnMinistries").value)))

  column2.appendChild(createDropDown("member[memberministrypositions_attributes][{0}][position_id]".replace("{0}",
      rowId),
    JSON.parse(document.getElementById("hdnPositions").value)))

  btn = document.createElement("INPUT")
  btn.setAttribute("type", "button")
  btn.value = "Eliminar"
  btn.onclick = () -> deleteMinistry(this)
  column3.appendChild(btn)
  false

@deleteMinistry = (btn) ->
  row = btn.parentNode.parentNode
  index = row.getAttribute("data-index")
  table = row.parentNode
  hiddenId = table.querySelectorAll("input[type=hidden]")[index]
  table.removeChild(btn.parentNode.parentNode)
  table.removeChild(hiddenId)
  false
