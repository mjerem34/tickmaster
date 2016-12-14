$('tr#<%= @spec_type_material.id %>').remove();
$("body").append("
<div class='notifs-tempo notif-destroy'><p>Suppression réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
