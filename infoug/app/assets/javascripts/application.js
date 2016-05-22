// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets

window.onload = function() {
    var sPath = window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
    if(sPage == ""){
        if (! localStorage.justOnce) {
            localStorage.setItem("justOnce", "true");
            window.location.reload();
        }
    }
};
function toggleTableDep() {
    var depTable = document.getElementById("dep_table");
    if(depTable.style.display == "") {
        depTable.style.display = "none";
        document.getElementById("display").innerHTML = "(Show)"; }
    else {
        depTable.style.display = "";
        document.getElementById("display").innerHTML = "(Hide)";
    }
}

function toggleTableSub() {
    var subTable = document.getElementById("sub_table");
    subTable.style.display = (subTable.style.display == "") ? "none" : "";
}

function toggleTableGro() {
    var groTable = document.getElementById("gro_table");
    groTable.style.display = (groTable.style.display == "") ? "none" : "";
}
$( document ).ready(function() {
    $("#sub").prop('disabled', true);
    $("#gro").prop('disabled', true);
    $('.dep').selectpicker();
    $('.sub').selectpicker();
    $('.gro').selectpicker();
    var dep = document.getElementById("dep");
    var sub = document.getElementById("sub");
    
     $('#dep').change(function(){
        var dep = document.getElementById("dep");
        var sub = document.getElementById("sub");
        var dep_val = dep.value;
        if (dep_val != "") {
             $('.sub').prop('disabled', false);
             $('#sub').selectpicker('refresh');
        } else {
            $('#sub').prop('disabled', true);
            $('#gro').prop('disabled', true);
            $('#gro').selectpicker('deselectAll');
            $('#sub').selectpicker('deselectAll');
            $('#sub').selectpicker('refresh');
            $('#gro').selectpicker('refresh');
        }
    });
        $('#sub').change(function(){
        var sub = document.getElementById("sub");
        var sub_val = sub.value;
        if (sub_val != "") {
            $('.gro').prop('disabled', false);
             $('#gro').selectpicker('refresh');
        } else {
            $('#gro').prop('disabled', true);
            $('#gro').selectpicker('deselectAll');
            $('#gro').selectpicker('refresh');
        }
    });
});




