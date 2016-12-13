$('#table_spec_materials > tbody').append("
  <tr id='<%= @spec_material.id %>'>
    <td><%= j select_tag 'spec_type_spec_material', options_for_select(@spec_type_materials.collect{|stm| [stm.name, stm.id]}, selected: @spec_type_material.id), class: 'dropdownSearchCreate form-control' %></td>
    <td><input type='text' name='name' value='<%= @spec_material.spec_value %>' class='form-control' id='input_spec_material'/></td>
    <td><button type='button' name='button' class='btn btn-danger' id='delete_spec_materials'>-</button></td>
  </tr>
");
$("#value_new_spec_material").val("");
$('.dropdownSearchCreate').last().selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Merci de sélectionner une valeur"});
$("body").append("
<div class='notifs-tempo notif-created-edited'><p>Création réussie !</p></div>
");
delay = (ms, func) -> setTimeout func, ms
delay 3000, ->  $('.notifs-tempo').remove()
