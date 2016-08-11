$(window).on('message', function(e){ // onclick
  for (var i = 0; i <= 30 ; i++){ // Reping 30 fois toute la liste (semblant de non-stop)
    $("#table_agencies > tbody > tr").each(function(){
      $.ajax({ // demarage ajax
        url: '/agencies_doPing', // url du controller rails pour pinger (methode doPing)
        type: 'GET',
        dataType: 'script',
        data: {
          host: e.originalEvent.data[0] // transfert de l'adress ip dans params[:host]
        },
        success: function(result){
          postMessage(result);
        }
      });
    });
  }
});
