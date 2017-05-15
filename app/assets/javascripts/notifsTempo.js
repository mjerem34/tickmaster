function notifSuccess(msg = ''){
  $("body").append("<div class='notifs-tempo alert alert-dismissible alert-success'><button class='close' type='button' data-dismiss='alert' aria-hidden='true'>×</button><h4><i class='icon fa fa-check'></i>Opération réussie !</h4><p>" + msg + "</p></div>");
  setTimeout(function(){
    $('.notifs-tempo').remove();
  }, 4000);
}

function notifAlert(msg){
  $("body").append("<div class='notifs-tempo alert alert-dismissible alert-warning'><button class='close' type='button' data-dismiss='alert' aria-hidden='true'>×</button><h4><i class='icon fa fa-warning'></i>Attention !</h4><p>" + msg + "</p></div>");
  setTimeout(function(){
    $('.notifs-tempo').remove();
  }, 4000);
}

function notifError(msg){
  $("body").append("<div class='notifs-tempo alert alert-dismissible alert-danger'><button class='close' type='button' data-dismiss='alert' aria-hidden='true'>×</button><h4><i class='icon fa fa-ban'></i>Opération échouée !</h4><p>" + msg + "</p></div>");
  setTimeout(function(){
    $('.notifs-tempo').remove();
  }, 4000);
}

function notifInfo(msg){
  $("body").append("<div class='notifs-tempo alert alert-dismissible alert-info'><button class='close' type='button' data-dismiss='alert' aria-hidden='true'>×</button><h4><i class='icon fa fa-info'></i>Opération échouée !</h4><p>" + msg + "</p></div>");
  setTimeout(function(){
    $('.notifs-tempo').remove();
  }, 4000);
}
