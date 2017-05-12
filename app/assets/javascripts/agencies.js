$(document).ready(function () {
  $.workers = {};
  $.results = [];
  $.donnees = [];
  $.booted = false;
  $.namesAgencies = [];


  $("#btn-do-graphic").click(function () {
    $.each($.namesAgencies, function (keyAgency, valueAgency) {
      $.tampon = {};
      $.each($.results, function (key, value) {
        $.each(value.data, function (keyData, valueData) {
          if (valueAgency == value.name) {
            $.tampon[keyData] = valueData;
          }
        })
      });
      $.donnees.push({"name": valueAgency, "data": $.tampon});
    });
    new Chartkick.LineChart("chart-1", $.donnees);
  });
  $(".button_ping_stop_agency").click(function(){
    var nameOfAgency = $(this).data("name"); // Va chercher ce qui a dans data-name="CLE LATTES"
    $.each($.workers, function (index, worker) {
      if(index == nameOfAgency){
        worker.terminate(); // Arrête e worker immédiatement
      }
    });

  });
  $(".button_ping_agency").click(function () {
    var idOfAgency = $(this).data("id"); // Va chercher ce qui a dans data-id="5"
    var ipOfAgency = $(this).data("ip"); // Va chercher ce qui a dans data-ip="127.0.0.1"
    var nameOfAgency = $(this).data("name"); // Va chercher ce qui a dans data-name="CLE LATTES"
    $.namesAgencies.push(nameOfAgency);
    $.worker = new Worker(window.URL.createObjectURL(new Blob(['function sleep(milliseconds) {var start = new Date().getTime();for (var i = 0; i < 1e7; i++) {if ((new Date().getTime() - start) > milliseconds){break;}}}onmessage = function(e) { for(var i = 0; i < 1e7; i++){var xhr = new XMLHttpRequest();xhr.open("' +
    'GET", "http://10.134.2.250/agencies/do_ping?host=" + e.data + "&t=" + Math.random(), false);xhr.send();var result = xhr.responseText;postMessage(result);sleep(1000);}}'])));
    $.workers[nameOfAgency] = $.worker;
    $.worker.onmessage = function (e) {
      var now = new Date(Date.now());
      var formatted = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
      // $.pings.push(parseInt(e.data));
      $("#agencyTd" + idOfAgency).replaceWith("<td id='agencyTd" + idOfAgency + "'>" + e.data + " ms</td>"); //ecriture du resultat dans le tableau
      $.results.push({
        "name": nameOfAgency,
        "data": {
          [formatted]: e.data
        }
      });
      // console.log($.results); result appear here Do something here e.data == 'msg from worker'
    };
    $.worker.postMessage(ipOfAgency);
  });

  $("#agencies_ping").click(function () { // onclick
    $("#table_agencies > tbody > tr").each(function () {
      // $.results.push({"name": nameOfAgency, "data": {}}); for(var key of $.results.values()){     console.log(key); }
      var idOfAgency = $(this).data("id"); // Va chercher ce qui a dans data-id="5"
      var ipOfAgency = $(this).data("ip"); // Va chercher ce qui a dans data-id="5"
      var nameOfAgency = $(this).data("name"); // Va chercher ce qui a dans data-name="CLE LATTES"

      if (ipOfAgency != "NULL") {
        $.namesAgencies.push(nameOfAgency);
        $.worker = new Worker(window.URL.createObjectURL(new Blob(['function sleep(milliseconds) {var start = new Date().getTime();for (var i = 0; i < 1e7; i++) {if ((new Date().getTime() - start) > milliseconds){break;}}}onmessage = function(e) { for(var i = 0; i < 1e7; i++){var xhr = new XMLHttpRequest();xhr.open("' +
        'GET", "http://10.134.2.250/agencies/do_ping?host=" + e.data + "&t=" + Math.random(), false);xhr.send();var result = xhr.responseText;postMessage(result);sleep(1000);}}'])));
        $.workers[nameOfAgency] = $.worker;
        $.worker.onmessage = function (e) {

          var now = new Date(Date.now());
          var formatted = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
          // $.pings.push(parseInt(e.data));
          $("#agencyTd" + idOfAgency).replaceWith("<td id='agencyTd" + idOfAgency + "'>" + e.data + " ms</td>"); //ecriture du resultat dans le tableau
          $.results.push({
            "name": nameOfAgency,
            "data": {
              [formatted]: e.data
            }
          });
          // console.log($.results); result appear here Do something here e.data == 'msg from worker'

        };
        $.worker.postMessage(ipOfAgency);
      }
    });
  });

  $("#agencies_ping_cancel").click(function () { // demande d'anulation de l'utilisateur
  $.each($.workers, function (index, worker) {
    // alert(worker);
    worker.terminate(); // Arrête le worker immédiatement
  });
});

// INDEX PAGE




// PAGE FORM (UPDATE, CREATE)
  $(document).on('click', "button[name='send-form']", function(){
    var dataAgence = {};
    var data_agence_comp = {};
    $.each($(".field_agency_value"), function (index, input) {
      data_agence_comp[input.name] = input.value;
    });
    if ($(this).data("id") != "0") {
      $.ajax({
        url: '/agencies/'+ $(this).data("id"),
        type: 'PUT',
        dataType: 'script',
        data: {
          agency: {
            name: $("#agency_name").val(),
            ip_address: $("#agency_ip_address").val()
          },
          data_agence_comp: data_agence_comp
        },
        error: function(result){
          notifError(result.responseText);
        }
      });
    } else {
      $.ajax({
        url: '/agencies',
        type: 'POST',
        dataType: 'script',
        data: {
          agency: {
            name: $("#agency_name").val(),
            ip_address: $("#agency_ip_address").val()
          },
          data_agence_comp: data_agence_comp
        },
        error: function(result){
          notifError(result.responseText);
        }
      });
    }
  });
}); //DOCUMENT READY BLOCK
