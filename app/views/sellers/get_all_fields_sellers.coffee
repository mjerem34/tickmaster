$("button[data-sellerid='<%= j @seller_id %>']").before("
  <%= j select_tag 'add_field_seller_select', options_for_select(@all_fields_sellers.collect{ |afs| [afs.name, afs.id] }, class: 'form-control') %>
  <input type='text' value='' placeholder='Entrez une valeur' class='form-control'/><button class='btn btn-success' id='btn_save_field_seller'>+</button><br>
");

$("#add_field_seller_select").last().selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Sélectionnez une valeur"});
$("button[data-sellerid='<%= j @seller_id %>']").remove();
