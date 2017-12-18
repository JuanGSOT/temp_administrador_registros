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
//= require bootstrap-combobox
//= require bootstrap-3-datepicker

/* fechas - history*/
function another(val) {
  var link = "/registries/history?option=";
  
  switch (val) {
    case "1":
      $("#act-btn a").attr("href", link + "1");
      break;
    case "2":
      $("#act-btn a").attr("href", link + "2");
      break;
    case "3":
      $("#act-btn a").attr("href", link + "3");
      break;
    case "4":
      $("#act-btn a").attr("href", link + "4");
      break;
    case "5":
      $('.menu').toggle('slow');
      $('#filter').val(0);  
      break;  
    case 1:
      $('.menu').toggle('slow');
      break;
  }
}

/* registry - new*/
function optionBlank(val) {
  console.log(val);
}

function thisHour(){
  var t = new Date();
  var date_now = t.getDate() + '-' + (t.getMonth() + 1) + '-' + t.getFullYear()
  var time_now = t.getHours() + ':' + t.getMinutes() + ':' + t.getSeconds();
  var now = date_now + ' ' + time_now;
  console.log(now);
}

function changeHref(){
  var a = $('#codig').val();
  var b = '/teachers/' + a;
  $('.trigger-du').attr('href', b);
}

function funA() {
  $('#del').css('display','none');
  $('#upd').css('display','block');
}
function funB(){
  $('#upd').css('display','none');
  $('#del').css('display','block');
}
/* history registry */
function graphic_hide() {
  if ($("#graphic-handle").hasClass("on")) {
    $("#graphic-handle").text("Mostrar Gráficos").removeClass("on").addClass("off");
  } else{
    $("#graphic-handle").text("Mostrar Tabla").removeClass("off").addClass("on");
  }

  $('.hide-registry').toggle("slow");
  lateral();
}
/* parcial lateral */
function lateral(){
  if (  ($(".main").height() > $(window).height()) && ($(window).width() >= 768)  ){
      $(".barra-lateral").css("height", "100vh");
  }else{
      $(".barra-lateral").css("height", "auto")
  }
}

/* datepicker i18n */
$.fn.datepicker.dates['es'] = { 
  days: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'], 
  daysShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'], 
  daysMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'], 
  months: ['Enero','Febrero','Marzo','Abril','Mayo','Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'], 
  monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'], 
  today: 'Hoy', 
  clear: 'Limpiar', 
  format: 'dd/mm/yyyy', 
  titleFormat: 'MM yyyy', 
  weekStart: 0 
};   

$(document).ready(function () {
  $(".only-number").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
         // Allow: Ctrl/cmd+A
        (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
         // Allow: Ctrl/cmd+C
        (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
         // Allow: Ctrl/cmd+X
        (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
         // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
  });
  
  $('.message').tooltip();
  
  if ($("#date_time").length !== 0){
    setInterval(function() { 
      var d = new Date();
      var h = d.getHours();
      var hr = (h > 12 ? h - 12 : h);
      var mi = d.getMinutes();
      var s = d.getSeconds();
      var time =  (hr<10?" 0":" ") + hr + ":" + (mi<10?"0":"") + mi + ":" + (s<10?"0":"") + s + " " + (h > 11 ? "pm" : "am");
      var selector = document.getElementById("date_time");
      selector.innerHTML = time;
    }, 1000);
  }
  thisHour();
  
  lateral();
  
  $(window).resize(function () {
    lateral();
  });
});
$(document).on('turbolinks:load', function () {
  $('.combobox').combobox();
  lateral();
  $('.form-group .date').datepicker({
    format: "dd/mm/yyyy",
    todayBtn: "linked",
    language: "es",
    autoclose: true,
    todayHighlight: true,
    toggleActive: true
  });
  $(".only-number").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
         // Allow: Ctrl/cmd+A
        (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
         // Allow: Ctrl/cmd+C
        (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
         // Allow: Ctrl/cmd+X
        (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
         // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
  });

  // teacher new
  // if ($("#teacher_contract").length > 0) {
    
  // }
});
