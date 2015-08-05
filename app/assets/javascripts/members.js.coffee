@addDetail = () ->
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

  btn = document.createElement("BUTTON")
  btn.className = "btn btn-danger"
  btn.onclick = () -> deleteMinistry(this)
  btn.innerHTML = 'Eliminar <span class="glyphicon glyphicon-remove-sign"></span>'
  column3.appendChild(btn)
  false

@deleteDetail = (btn) ->
  row = btn.parentNode.parentNode
  index = row.getAttribute("data-index")
  table = row.parentNode
  hiddenId = table.querySelectorAll("input[type=hidden]")[index]
  table.removeChild(btn.parentNode.parentNode)
  table.removeChild(hiddenId)
  false

@changePhoto = () ->
  event.preventDefault();
  http = new XMLHttpRequest();
  fldPhoto = document.getElementById("fldPhoto");
  if(fldPhoto)
    photo = fldPhoto.files[0];
    formData = new FormData();
    formData.append("photo", photo);
    $.ajax({
      url: "/members/savePhoto",
      contentType: false,
      type: 'POST',
      dataType: 'json',
      data: formData,
      processData: false,
      complete: (data) ->
        document.getElementById("member_Photo").value = data.responseText;
        document.getElementById("member_PhotoPath").value = document.getElementById("imgPhoto").src = '/assets/' + data.responseText;
        true
    });
  #      http.open("POST","/members/savePhoto",true);
  #      http.setRequestHeader("Content-type", "multipart/form-data");
  #      http.onreadystatechange = () ->
  #        if (http.readyState==4 && http.status==200)
  #          document.getElementById("imgPhoto").src = "/assets/images/photos/" + http.responseText;
  #      http.send(formData);
  false
