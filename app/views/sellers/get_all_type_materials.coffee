$("div#<%= j @seller_id %> > div > div > div > table > tbody > .row_add_type_material").before("
  <tr class='selectTypeMaterialForSeller'>
    <td style='overflow:initial;'>
      <%= j select_tag 'selectTypeMaterialForSeller', options_for_select(@type_materials.collect{|tm| [tm.name.titleize, tm.id]}), {class: 'dropdownSearchCreate'}%>
    </td>
    <td>
      <button type='button' name='button' class='btn btn-success' id='save_type_material'>+</button>
    </td>
  </tr>
  <script>
  $('select').selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: 'Merci de sélectionner une valeur'});
  </script>
");
$("div#<%= j @seller_id %> > div > div > div > table > tbody > .row_add_type_material").remove();
