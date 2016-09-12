$("#fields-sellers").empty().html("
  <div class='row'>
    <div class='col-md-4' id='fields-sellers-titles'>
      <% @seller.fields_seller_sellers.each do |fss| %>
        <input type='text' name='name' value='<%= j fss.fields_seller.name %>' class='form-control' disabled><br>
      <% end %>
    </div>
    <div class='col-md-4' id='fields-sellers-values'>
      <% @seller.fields_seller_sellers.each do |fss| %>
        <input type='text' name='name' value='<%= j fss.content %>' class='form-control'><br>
      <% end %>
    </div>
  </div>

  <div class='row'>
    <div class='col-md-8'>
      <button type='button' name='button' class='btn btn-success' id='add-fields-sellers' style='width:100%;'>+</button>
    </div>
  </div>
");
