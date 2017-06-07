//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require highcharts
//= require adminlte
//= require chartkick
//= require jquery.slimscroll.min
//= require selectize
//= require bootstrap-slider
//= require jquery-ui.min
//= require procedures
//= require header
//= require mySelectize
//= require notifsTempo
//= require sweetalert2.min
//= require jquery.dataTables.min
//= require dataTables.bootstrap.min
//= require tools
//= require moment.min
//= require datetime-moment

// FROALA EDITOR
//= require froala_editor.min.js
//= require plugins/align.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/emoticons.min.js
//= require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/help.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/print.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/save.min.js
//= require plugins/table.min.js
//= require plugins/special_characters.min.js
//= require plugins/url.min.js
//= require plugins/video.min.js
//= require languages/fr.js
// FROALA EDITOR
$(document).ready(function(){

  $('.froalaEditor').froalaEditor({
    toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'insertFile', 'insertLink', 'insertImage', 'insertVideo', 'insertTable', '|', 'quote', 'insertHR', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'],
    imageResizeWithPercent: true,
    imageDefaultWidth: 70,
    height: 500,
    imageUploadMethod: 'POST',
    imageUploadURL: '/attachments/upload',
    fileUploadMethod: 'POST',
    fileUploadURL: '/attachments/upload',
    videoUploadMethod: 'POST',
    videoUploadURL: '/attachments/upload'
  }).on('froalaEditor.image.removed', function(e, editor, file){
    $.ajax({
      url: '/attachments/destroy',
      type: 'PUT',
      dataType: 'script',
      data: {
        file: file.attr('src')
      },
      success: function(jqXHR){
        console.log("Image supprimée !");
      },
      error: function(jqXHR){
        console.log("Impossible de supprimer l'image !");
      }
    });
  }).on('froalaEditor.file.unlink', function(e, editor, file){
    $.ajax({
      url: '/attachments/destroy',
      type: 'PUT',
      dataType: 'script',
      data: {
        file: file.href
      },
      success: function(jqXHR){
        console.log("Fichier supprimé !");
      },
      error: function(jqXHR){
        console.log("Impossible de supprimer le fichier !");
      }
    });
  }).on('froalaEditor.video.removed', function(e, editor, file){
    $.ajax({
      url: '/attachments/destroy',
      type: 'PUT',
      dataType: 'script',
      data: {
        file: file[0].firstChild.src
      },
      success: function(jqXHR){
        console.log("Video supprimée !");
      },
      error: function(jqXHR){
        console.log("Impossible de supprimer la vidéo !");
      }
    });
  });

  if ($('.froalaEditor').attr('disabled')){
    $(".froalaEditor").froalaEditor("edit.off");
  }

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
  $.fn.dataTable.moment('DD MMM YYYY HH:mm');
  $('.dataTable').on('error.dt', function( e, settings, techNote, message ){
    console.log( 'An error has been reported by DataTables: ', message );
  }).DataTable({
    "order":[[4, "desc"]],
    "language": {
      "sProcessing": "Traitement en cours ...",
      "sLengthMenu": "Afficher _MENU_ lignes",
      "sZeroRecords": "Aucun résultat trouvé",
      "sEmptyTable": "Aucune donnée disponible",
      "sInfo": "Lignes _START_ à _END_ sur _TOTAL_",
      "sInfoEmpty": "",
      "sInfoFiltered": "(Filtrer un maximum de _MAX_)",
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

  // $(document).on('keyup', 'input[type="number"]', function(e){
  //   alert($(this).val());
  //   alert($(this).attr("max"));
  //   if ($(this).val() > $(this).attr("max")) {
  //     $(this).val($(this).attr("max"));
  //   // }else if ($(this).val() < $(this).attr('min')) {
  //   //   $(this).val($(this).attr("min"));
  //   }
  // });


});
