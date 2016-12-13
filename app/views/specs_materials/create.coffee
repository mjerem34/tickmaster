$('#table_specs_materials > tbody').append("
  <tr id='<%= @specs_material.id %>'>
    <td><%= j select_tag 'spec_type_specs_material', options_for_select(@specs_types_materials.collect{|stm| [stm.name, stm.id]}, selected: @specs_types_material.id), class: 'dropdownSearchCreate form-control' %></td>
    <td><input type='text' name='name' value='<%= @specs_material.spec_value %>' class='form-control' id='input_spec_material'/></td>
    <td><button type='button' name='button' class='btn btn-danger' id='delete_specs_materials'>-</button></td>
  </tr>
");
$("#value_new_specs_material").val("");
$('.dropdownSearchCreate').last().selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Merci de sélectionner une valeur"});
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Création réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
