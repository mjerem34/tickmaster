$("tr#<%= @specs_material.id %>").remove();
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Suppression réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
