$("#name_new_field_agency").val("");
$("table > tbody").append("
<tr id='<%= @field_agency.id %>'>
  <td><input type='text' name='name' value='<%= @field_agency.name %>' class='form-control' id='input_field_agency'></td>
  <td><button type='button' name='button' class='btn btn-danger' id='delete_field_agency'>-</button></td>
</tr>
");
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Création réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
