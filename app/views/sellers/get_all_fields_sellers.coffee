$("#table_fields_sellers[data-seller_id='<%= @seller_id %>']").children("tbody").append("
  <tr><td><%= j select_tag 'add_field_seller_select', options_for_select(@all_fields_sellers.collect{ |afs| [afs.name, afs.id] }, class: 'form-control') %></td>
  <td><input data-seller='<%= @seller_id %>' type='text' value='' placeholder='Entrez une valeur' class='form-control' id='new_field_seller_input' /></td><td><button type='button' name='button' class='btn btn-success' id='save_field_seller'>+</button></td></tr>
");

$("#table_fields_sellers[data-seller_id='<%= @seller_id %>'] > tbody > tr > td > #add_field_seller_select").last().selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Sélectionnez une valeur"});
$("button[data-sellerid='<%= j @seller_id %>']").parent().parent().remove();
