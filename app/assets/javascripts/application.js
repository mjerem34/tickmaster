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
//= require bootstrap-sprockets
//= require ckeditor/init
//= require jquery_ujs
//= require bootstrap-slider
//= require chartkick
//= require_tree .
//= require dropzone

// JS CODE AGENCIES__________________________________________________________________________________________________________________________________________________________________________________

$(document).ready(function(){
  $.pings = [];
  $(".test").click(function(){
    $.ajax({ // demarage ajax
      url: '/agencies_createGraphics', // url du controller rails pour pinger (methode doPing)
      type: 'GET',
      dataType: 'script',
      data: {
        pings: $.pings // transfert de l'adress ip dans params[:host] pour le récup dans le controller
      },
      success: function(result){
        if (result == "true"){
          alert("True");
        }else{
          alert("False");
        }
      }
    });
  });

  //   var i = 0;
  //   while(i < 5){
  //     window.setInterval(function(){
  //       alert(i);
  //       i += 1;
  //     }, 1);
  //   }});
  //


  // Script pour juste un seul ping (click sur bouton pinger)
  var booted = false;
  $.xhrPool = []; // array of uncompleted requests
  $.xhrPool.abortAll = function() { // our abort function
    $(this).each(function(idx, jqXHR) {
      jqXHR.abort(); // abortage
    });
    $.xhrPool.length = 0
  };
  $.ajaxSetup({
    beforeSend: function(jqXHR) { // before jQuery send the request we will push it to our array
      $.xhrPool.push(jqXHR); //insertion de la requete dans le pool
    },
  complete: function(jqXHR) { // when some of the requests completed it will splice from the array
    var index = $.xhrPool.indexOf(jqXHR); //recherche de lindex
      if (index > -1) {
        $.xhrPool.splice(index, 1);
      }
    }
  });

  $(".button_ping_agency").click(function(){
    if($(this).html() == "Ping" && booted == false){
      $(this).html("Stop"); // réécriture du bouton pour pouvoir arreter
      booted = true; // Vérouillage pour éviter les bugs
      var ipOfAgency = $(this).data("ip"); // Va chercher ce qui a dans data-ip="127.0.0.1"
      var idOfAgency = $(this).data("id"); // Va chercher ce qui a dans data-id="5"


      function sleep(milliseconds) {
        var start = new Date().getTime();
        for (var i = 0; i < 1e7; i++) {
          if ((new Date().getTime() - start) > milliseconds){
            break;
          }
        }
      }

      for(var i = 0; i <= 1000; i++){
        $.ajax({ // demarage ajax
          url: '/agencies_doPing', // url du controller rails pour pinger (methode doPing)
          type: 'GET',
          dataType: 'script',
          data: {
            host: ipOfAgency // transfert de l'adress ip dans params[:host] pour le récup dans le controller
          },
          success: function(result){
            if (result == "false"){ // peut retourner false si ip est null ou si TimeOut
              $("#agencyTd"+idOfAgency).replaceWith("<td id='agencyTd"+idOfAgency+"'>TimeOut</td>"); //ecriture du resultat dans le tableau
            }else{
              $.pings.push(parseInt(result));
              $("#agencyTd"+idOfAgency).replaceWith("<td id='agencyTd"+idOfAgency+"'>"+result+" ms <button type='button' name='button' data-id='"+idOfAgency+"' data-ip='"+ipOfAgency+"' class='button_ping_agency'>Stop</button></td>");//ecriture du resultat dans le tableau
            }
          }
        });
    }
    }else {
      $(this).html("Ping"); // réécriture du bouton pour pouvoir relancer le ping
      booted = false; // Dévérouillage
      $.xhrPool.abortAll(); // Appel a la fonction abortage

    }
  });




// <!-- Script JS pour le bouton pinger toutes les agences -->
  $("#agencies_ping").click(function(){ // onclick
    for (var i = 0; i <= 30 ; i++){ // Reping 30 fois toute la liste (semblant de non-stop)
    $("#table_agencies > tbody > tr").each(function(){
      var id = $(this).data("id"); // trouve l'id de l'agence
      $.ajax({ // demarage ajax
        url: '/agencies_doPing', // url du controller rails pour pinger (methode doPing)
        type: 'GET',
        dataType: 'script',
        data: {
          host: $(this).data('ip') // transfert de l'adress ip dans params[:host]
        },
        success: function(result){
          if (result == "false"){ // peut retourner false si ip est null ou si TimeOut
            $("#agencyTd"+id).replaceWith("<td style='color: blue;'id='agencyTd"+id+"'>TimeOut</td>"); //ecriture du resultat dans le tableau
          }else if(result < 100){
            $("#agencyTd"+id).replaceWith("<td style='color: green;' id='agencyTd"+id+"'>"+result+" ms</td>");//ecriture du resultat dans le tableau
          }else if(result > 100 && result < 400){
            $("#agencyTd"+id).replaceWith("<td style='color: orange;' id='agencyTd"+id+"'>"+result+" ms</td>");//ecriture du resultat dans le tableau
          }else {
            $("#agencyTd"+id).replaceWith("<td style='color: red;' id='agencyTd"+id+"'>"+result+" ms</td>");//ecriture du resultat dans le tableau
          }
        }
      });
  });
}
  });
  $("#agencies_ping_cancel").click(function(){ // demande d'anulation de l'utilisateur
    $.xhrPool.abortAll(); // Appel a la fonction abortage
  });
});
