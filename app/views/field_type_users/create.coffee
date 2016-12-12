$("#name_add_field_type_users").val("");
$("table#table_field_type_users > tbody").append("
<tr id='<%= @field_type_user.id%>' class='fields_type_user'>
  <td><input type='text' name='name_field_type_users' value='<%= @field_type_user.name %>' class='form-control'/></td>
  <td><button type='button' name='delete_field_type_users' class='btn btn-danger' id='delete_field_type_users'>-</button></td>
</tr>
");
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Création réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
