$("#fields-seller-with-btn-add").empty().html("
  <div id='fields-sellers'>
    <% unless @seller.nil? %>
      <% @seller.field_seller_sellers.each do |fss| %>
        <div class='row'>
          <div class='col-md-4' id='fields-sellers-titles'>
            <input type='text' name='name' value='<%= fss.field_seller.name %>' class='form-control' disabled><br>
          </div>
          <div class='col-md-4' id='fields-sellers-values'>
            <input type='text' name='name' value='<%= fss.content %>' class='form-control'><br>
          </div>
          <div class='col-md-4' id='div-btns-delete-row'>
            <button type='button' name='button' class='btn btn-danger' id='btn-delete-row'>&#8211;</button>
          </div>
        </div>
      <% end %>
    <% end %>
  </div>

  <div class='row'>
    <div class='col-md-8'>
      <button type='button' name='button' class='btn btn-success' id='add-fields-sellers' style='width:100%;'>+</button>
    </div>
  </div>
");
