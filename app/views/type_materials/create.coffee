$("#name_new_type_material").val("");
$("#table_type_material > tbody").append("
<tr id='<%= @type_material.id %>'>
  <td><input type='text' name='name' value='<%= @type_material.name %>' class='form-control' id='input_type_material'></td>
  <td><button type='button' name='button' class='btn btn-danger' id='delete_type_material'>-</button></td>
</tr>
");
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Création réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
