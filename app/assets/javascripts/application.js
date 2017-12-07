// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery_ujs
//= require chartjs
//= require sweetalert2
//= require bootstrap-combobox

/* fechas - history*/
function another(val) {
  if (val === '0') {
    var menu = document.getElementsByClassName("menu");
    menu[1].style.display = "block";
    menu[0].style.display = "none";
  }
}

/* registry - new*/
function optionBlank(val) {
  console.log(val);
}

$(document).ready(function () {
  if ($(".alert").length === 1 || $(".notice").length === 1){
    setTimeout(function () {
      $(".notice, .alert").slideUp(3000).hide(4000);
    }, 3000);
  }
  $('.message').tooltip();
});

function thisHour(){
  var t = new Date();
  var date_now = t.getDate() + "-" + (t.getMonth() + 1) + "-" + t.getFullYear()
  var time_now = t.getHours() + ":" + t.getMinutes() + ":" + t.getSeconds();
  var now = date_now + " " + time_now;
  console.log(now);
  //$("#registry_loan").val(now);
}

function changeHref(){
  var a = $("#codig").val();
  var b = "/teachers/" + a;
  $("#trigger-du").attr("href", b);
}

function funA() {
  $("#del").css("display","none");
  $("#upd").css("display","block");
}
function funB(){
  $("#upd").css("display","none");
  $("#del").css("display","block");
}
