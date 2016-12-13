$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Modification réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
