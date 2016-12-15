// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require highcharts
//= require chartkick
//= require ckeditor/init
//= require selectize
//= require bootstrap-slider
//= require fixedheadertable
//= require incidents
//= require jquery-ui.min
//= require jquery.tablesorter.min
//= require jquery.tablesorter.widgets.min
//= require nprogress
//= require procedures
//= require header
//= require mySelectize
//= require notifsTempo




var currentBoxNumber = 0;
$("#next").keypress(function (event) {
  if (event.keyCode == 13) {
    textboxes = $("input.next");
    currentBoxNumber = textboxes.index(event.target);
    if (textboxes[currentBoxNumber + 1] != null) {
      nextBox = textboxes[currentBoxNumber + 1];
      nextBox.focus();
      nextBox.select();
      event.preventDefault();
      return false;
    }
  }
});
$(document).on('click', 'tr[data-link]', function () {
  window.location = $(this).data("link")
});

$(document).ready(function () {
  $(".table-hover").tablesorter({
    theme: 'blue',
    widgets: ['filter']
  });
});
$(document).ready(function () {
  $('.table-hover').fixedHeader();
});
$(window).scroll(function () {
  posScroll = $(document).scrollTop();
  if (posScroll >= 100){
    $('.updown-arrow').css({"visibility": "visible"});
  }else{
    $('.updown-arrow').css({"visibility": "hidden"});
  }
  });
$(document).ready(function () {
  $("input.tablesorter-filter").addClass('form-control');
});

$("input:text:visible:first").focus();

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}
