$('#name_new_spec_type_material').val("");
$('#table_spec_type_materials > tbody').append("
  <tr id='<%= @spec_type_material.id %>'>
    <td><input type='text' name='name' value='<%= @spec_type_material.name %>' class='form-control' id='input_spec_type_material'></td>
    <td><button type='button' name='button' class='btn btn-danger' id='delete_spec_type_material'>-</button></td>
  </tr>
");
notifsTempo('Création réussie', 4000, 'green');
