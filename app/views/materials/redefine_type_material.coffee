$("#fields-specs-types-materials").empty().html("
<div class='row'>
  <div class='col-md-4' id='fields-specs-types-titles'>
    <% @specs_types_materials.each do |stm|  %>
      <input type='text' value='<%= j stm.name%>' disabled class='form-control'>
      <br>
    <% end %>
  </div>
  <div class='col-md-4' id='fields-specs-types-values'>
    <% @specs_types_materials.each do |stm|  %>
      <input type='text' name='<%= j stm.name%>' class='form-control'>
      <br>
    <% end %>
  </div>
</div>
<div class='row'>
  <div class='col-md-8'>
    <button type='button' name='button' class='btn btn-success' id='add-fields-specs-types' style='width:100%;'>+</button>
  </div>
</div>
");

$('#SelectSellersDiv').empty().html("
  <% unless @sellers_names_and_id.nil? %>
    <%= j select_tag 'SelectSellers', options_for_select(@sellers_names_and_id.collect{|seller| [seller.content.titleize, seller.seller_id]}), {class: 'dropdownSearch form-control'} %><br><br>
  <% else %>
    <%= j select_tag 'SelectSellers', '<option>Aucun vendeur</option>'.html_safe, {class: 'dropdownSearch form-control'} %><br><br>
    <% end %>
");

$("#fields-sellers").empty().html("
  <div class='row'>
    <div class='col-md-4' id='fields-sellers-titles'>
      <% unless @seller.nil? %>
        <% @seller.fields_seller_sellers.each do |fss| %>
          <input type='text' name='name' value='<%= j fss.fields_seller.name %>' class='form-control' disabled><br>
        <% end %>
      <% else %>
          <input type='text' name='name' class='form-control'><br>
      <% end %>
    </div>
    <div class='col-md-4' id='fields-sellers-values'>
      <% unless @seller.nil? %>
        <% @seller.fields_seller_sellers.each do |fss| %>
          <input type='text' name='name' value='<%= j fss.content %>' class='form-control'><br>
        <% end %>
      <% else %>
        <input type='text' name='name' class='form-control'><br>
      <% end %>
    </div>
  </div>
  <div class='row'>
    <div class='col-md-8'>
      <button type='button' name='button' class='btn btn-success' id='add-fields-sellers' style='width:100%;'>+</button>
    </div>
  </div>
");
