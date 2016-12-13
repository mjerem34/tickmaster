$('#name_new_specs_types_material').val("");
$('#table_specs_types_materials > tbody').append("
  <tr id='<%= @specs_types_material.id %>'>
    <td><input type='text' name='name' value='<%= @specs_types_material.name %>' class='form-control' id='input_specs_types_material'></td>
    <td><button type='button' name='button' class='btn btn-danger' id='delete_specs_types_material'>-</button></td>
  </tr>
");
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Création réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
