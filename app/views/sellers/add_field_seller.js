$("table#table_field_seller_<%= @seller.id %> > tbody").append(`
  <tr data-seller-id='<%= @seller.id %>' data-field-seller-id="<%= @field_seller.id %>" >
    <td><%= @field_seller.name %></td>
    <td><input name="name" value="<%= @field_seller_seller.content %>" class="form-control" id="value_field_seller"/></td>
    <td><button type="button" name="button" class="btn btn-danger" id="delete_field_seller">-</button></td>
  </tr>
  `);
notifsTempo("Création réussie", 4000, "green");
$("#table_field_seller_<%= @seller.id %>").find("#value_new_field_seller").val("");
