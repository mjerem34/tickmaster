$("#name_new_field_agency").val("");
$("table > tbody").append(`
<tr id='<%= @field_agency.id %>'>
  <td><input type='text' name='name' value='<%= @field_agency.name %>' class='form-control' id='input_field_agency'></td>
  <td><button type='button' name='button' class='btn btn-danger' id='delete_field_agency'>-</button></td>
</tr>
`);
notifsTempo("Création réussie !", 4000, 'green');
