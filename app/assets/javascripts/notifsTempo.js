function notifsTempo(msg, time, color){
  $("body").append("<div class='notifs-tempo notif-" + color + "'><p>" + msg + "</p></div>");
  setTimeout(function(){
    $('.notifs-tempo').remove();
  }, time);
}
