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
//= require adminlte
//= require chartkick
//= require jquery.slimscroll.min
//= require ckeditor/init
//= require selectize
//= require bootstrap-slider
//= require incidents
//= require jquery-ui.min
//= require procedures
//= require header
//= require mySelectize
//= require notifsTempo
//= require sweetalert
//= require jquery.dataTables.min



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


$("input:text:visible:first").focus();

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}
$('.datatable').DataTable({
  dom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  pagingType: "bootstrap",
  responsive: true
});
