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

setInterval(function() { 
  var d = new Date();
  var h = d.getHours();
  var time = (h > 12 ? h - 12 : h) + ":" + d.getMinutes() + ":" + d.getSeconds() + " " + (h > 11 ? "pm" : "am");
  var selector = document.getElementById("date_time");
  selector.innerHTML = time;
}, 1000);