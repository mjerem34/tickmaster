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
//= require dataTables.bootstrap.min
//= require tools

$(document).ready(function(){
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
  // var row0 = $(".fixFirstRow > tbody > tr:first").remove()[0];
  // // DataTable enabled and Fix first row
  // $.fn.dataTable.ext.errMode = 'none';
  // $('.fixFirstRow').on('error.dt', function( e, settings, techNote, message ){
  //   console.log( 'An error has been reported by DataTables: ', message );
  // }).DataTable({
  //   "language": {
  //     "sProcessing": "Traitement en cours ...",
  //     "sLengthMenu": "Afficher _MENU_ lignes",
  //     "sZeroRecords": "Aucun résultat trouvé",
  //     "sEmptyTable": "Aucune donnée disponible",
  //     "sInfo": "Lignes _START_ à _END_ sur _TOTAL_",
  //     "sInfoEmpty": "",
  //     "sInfoFiltered": "(Filtrer un maximum de_MAX_)",
  //     "sInfoPostFix": "",
  //     "sSearch": "Chercher:",
  //     "sUrl": "",
  //     "sInfoThousands": ",",
  //     "sLoadingRecords": "Chargement...",
  //     "oPaginate": {
  //       "sFirst": "Premier", "sLast": "Dernier", "sNext": "Suivant", "sPrevious": "Précédent"
  //     },
  //     "oAria": {
  //       "sSortAscending": ": Trier par ordre croissant", "sSortDescending": ": Trier par ordre décroissant"
  //     }
  //   },
  //   "fnDrawCallback": function(oSettings){
  //     $(this + '> tbody > tr:first').before(row0);
  //   }
  // });
  $('.dataTable').on('error.dt', function( e, settings, techNote, message ){
    console.log( 'An error has been reported by DataTables: ', message );
  }).DataTable({
    "language": {
      "sProcessing": "Traitement en cours ...",
      "sLengthMenu": "Afficher _MENU_ lignes",
      "sZeroRecords": "Aucun résultat trouvé",
      "sEmptyTable": "Aucune donnée disponible",
      "sInfo": "Lignes _START_ à _END_ sur _TOTAL_",
      "sInfoEmpty": "",
      "sInfoFiltered": "(Filtrer un maximum de_MAX_)",
      "sInfoPostFix": "",
      "sSearch": "Chercher:",
      "sUrl": "",
      "sInfoThousands": ",",
      "sLoadingRecords": "Chargement...",
      "oPaginate": {
        "sFirst": "Premier", "sLast": "Dernier", "sNext": "Suivant", "sPrevious": "Précédent"
      },
      "oAria": {
        "sSortAscending": ": Trier par ordre croissant", "sSortDescending": ": Trier par ordre décroissant"
      }
    }
  });

  // SWEETALERT BEFORE FOR ASK CONFIRMATION
  // MODELE DE BOUTON :
  // <button type="button" name="button" data-redirect="<%= agencies_url %>" data-method="delete" data-href="<%= agency_path(agency.id) %>" class="btn btn-flat btn-default btn-modal ask_for_confirm">Supprimer</button>
  $('.ask_for_confirm').click(function(e) {
    $.linkURL = $(this).data("href");
    $.method = $(this).data("method");
    $.redirection = $(this).data("redirect");
    console.log($.linkURL);
    swal({
      title: "Confirmation",
      text: "Êtes vous sûr de vouloir faire cela ?",
      type: "warning",
      showCancelButton: true
    }, function(confirmed) {
      if (confirmed) {
        $.ajax({
          url: $.linkURL,
          method: $.method,
          dataType: 'script',
          success: function(){
            // Redirect the user
            window.location.href = $.redirection;
            notifSuccess("");
          },
          error: function(result){
            notifError(result.responseText);
          }
        });
      } else {
        return false;
      }
    });
  });
});
