$(document).ready(function () {

  $.workers = {};
  $.results = [];
  $.donnees = [];
  $.booted = false;
  $.namesAgencies = [];


  $("#btn-do-graphic").click(function () {
    $.donnees = [];
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

    Chartkick.LineChart("chart-1", $.donnees);
  });

  $("button[name='refresh']").click(function () {
    $.donnees = [];
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
    Chartkick.LineChart("chart-1", $.donnees);
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
    var oneTime = true;
    var idOfAgency = $(this).data("id"); // Va chercher ce qui a dans data-id="5"
    var ipOfAgency = $(this).data("ip"); // Va chercher ce qui a dans data-ip="127.0.0.1"
    var nameOfAgency = $(this).data("name"); // Va chercher ce qui a dans data-name="CLE LATTES"
    $.namesAgencies.push(nameOfAgency);
    $.worker = new Worker(window.URL.createObjectURL(new Blob(['function sleep(milliseconds) {var start = new Date().getTime();for (var i = 0; i < 1e7; i++) {if ((new Date().getTime() - start) > milliseconds){break;}}}onmessage = function(e) { for(var i = 0; i < 1e7; i++){var xhr = new XMLHttpRequest();xhr.open("' +
    'GET", "http://' + window.location.host + '/agencies/do_ping?host=" + e.data + "&t=" + Math.random(), false);xhr.send();var jqXHR = xhr.responseText;postMessage(jqXHR);sleep(300);}}'])));
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
      // console.log($.results); jqXHR appear here Do something here e.data == 'msg from worker'
    };
    $.worker.postMessage(ipOfAgency);
  });

  $("#agencies_ping").click(function () {
    if (!$.booted) {
      console.log('click');
      $.booted = true;
      $("#table_agencies > tbody > tr").each(function () {
        var idOfAgency = $(this).data("id"); // Va chercher ce qui a dans data-id="5"
        var ipOfAgency = $(this).data("ip"); // Va chercher ce qui a dans data-id="5"
        var nameOfAgency = $(this).data("name"); // Va chercher ce qui a dans data-name="CLE LATTES"
        if (ipOfAgency != "NULL") {
          $.namesAgencies.push(nameOfAgency);
          $.worker = new Worker(window.URL.createObjectURL(new Blob(['function sleep(milliseconds) {var start = new Date().getTime();for (var i = 0; i < 1e7; i++) {if ((new Date().getTime() - start) > milliseconds){break;}}}onmessage = function(e) { for(var i = 0; i < 1e7; i++){var xhr = new XMLHttpRequest();xhr.open("' +
          'GET", "http://' + window.location.host + '/agencies/do_ping?host=" + e.data + "&t=" + Math.random(), false);xhr.send();var jqXHR = xhr.responseText;postMessage(jqXHR);sleep(300);}}'])));
          $.workers[nameOfAgency] = $.worker;
          $.worker.onmessage = function (e) {
            var now = new Date(Date.now());
            var formatted = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
            $("#agencyTd" + idOfAgency).replaceWith("<td id='agencyTd" + idOfAgency + "'>" + e.data + " ms</td>"); //ecriture du resultat dans le tableau
            $.results.push({
              "name": nameOfAgency,
              "data": {
                [formatted]: e.data
              }
            });
          };
          $.worker.postMessage(ipOfAgency);
        }
      });
    }
  });


  $("#agencies_ping_cancel").click(function () {
    // demande d'anulation de l'utilisateur
    if ($.booted) {
      $.each($.workers, function (index, worker) {
        // alert(worker);
        worker.terminate(); // Arrête le worker immédiatement
        $.booted = false;
      });
    }
  });

  // INDEX PAGE

  $(document).on('keyup', '#agency_ip_address', function(e){
    if (e.keyCode == 13) {
      $('button[name="send-form"]').click();
    }
  });

  // PAGE FORM (UPDATE, CREATE)
  $(document).on('click', "button[name='send-form']", function(){
    var dataAgence = {};
    var data_agence_comp = {};
    $.each($(".field_agency_value"), function (index, input) {
      data_agence_comp[input.name] = input.value;
    });
    if ($(this).data("id") != "0") {
      // We are on the edit page and @agency exists
      $.ajax({
        url: '/agencies/'+ $(this).data("id"),
        type: 'PUT',
        dataType: 'script',
        data: {
          agency: {
            name: $("#agency_name").val(),
            ip_address: $("#agency_ip_address").val(),
            data_agence_comp: data_agence_comp
          },
        },
        success: function(jqXHR){
          notifSuccess();
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        }
      });
    } else {
      // We are on the new page and @agency does not exists
      $.ajax({
        url: '/agencies',
        type: 'POST',
        dataType: 'script',
        data: {
          agency: {
            name: $("#agency_name").val(),
            ip_address: $("#agency_ip_address").val()
          },
        },
        success: function(jqXHR){
          notifSuccess();
          window.location = "/agencies/" + jqXHR + "/edit";
        },
        error: function(jqXHR){
          notifError(JSON.parse(jqXHR.responseText)[0]);
        }
      });
    }
  });

  $('button[name="destroy_agency"]').click(function(e) {
    $.id = $(this).data('id');
    swal({
      title: 'Êtes-vous sûr ?',
      text: "Cette opération est irréversible !",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Oui',
      cancelButtonText: "Non"
    }).then(function () {
      $.ajax({
        url: "/agencies/" + $.id,
        method: "DELETE",
        dataType: 'script',
        success: function(){
          notifSuccess();
          location.reload();
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        }
      });
    })
  });
}); //DOCUMENT READY BLOCK
