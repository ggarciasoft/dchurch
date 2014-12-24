/**
 * Created by ggarciasoft on 12/21/2014.
 */
function addMinistry() {
    var lastRow = document.querySelectorAll("#tblMinistries tbody tr:last-child")[0];
    var rowId = 0;
    if (lastRow)
        rowId = parseInt(lastRow.getAttribute("data-index")) + 1;
    var tblMinistries = document.getElementById("tblMinistries");
    var row = tblMinistries.insertRow();
    row.setAttribute("data-index", rowId);
    var column1 = row.insertCell(0);
    var column2 = row.insertCell(1);
    var column3 = row.insertCell(2);

    var txt1 = document.createElement("INPUT");
    txt1.setAttribute("type", "text");
    txt1.setAttribute("name", "member[memberministrypositions_attributes][{0}][ministry_id]".replace("{0}", rowId));
    column1.appendChild(txt1);

    var txt2 = document.createElement("INPUT");
    txt2.setAttribute("type", "text");
    txt2.setAttribute("name", "member[memberministrypositions_attributes][{0}][[position_id]]".replace("{0}", rowId));
    column2.appendChild(txt2);

    var btn = document.createElement("INPUT");
    btn.setAttribute("type", "button");
    btn.value = "Eliminar";
    column3.appendChild(btn);
}