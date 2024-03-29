// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery-ui/dialog
//= require jquery-ui/autocomplete

$(document).on('ready page:load', function (e) {
    configureDialog();
    configureAutocomplete();
    Turbolinks.enableProgressBar(true);
});
/*.ajaxStart(function(){
 alert("start");
 }).ajaxStop(function(){
 alert("stop");
 });*/
/*
 function linkHeaderMenuClick(){
 $("#divHeaderMenu a[href^=#]").click(function(){

 });
 }
 */
function saveAndNewClick() {
    document.getElementById("hdnAdditionalAction").value = "saveandnew";
}

function createDropDown(name, lst) {
    var drp = document.createElement("SELECT");
    drp.setAttribute("name", name);
    var option;
    for (var i = 0; i < lst.length; i++) {
        var item = lst[i];
        option = document.createElement("OPTION");
        option.text = item[0];
        option.value = item[1];
        drp.appendChild(option);
    }
    return drp;
}

function configureDialog() {
    $(".divDialog").dialog({
        modal: true,
        autoOpen: false
    });
}

function configureAutocomplete() {
    $(".autocomplete").autocomplete({
        source: "/",
        autoOpen: false
    });
}

function validateForm() {

}