$("#table_type_materials_sellers_<%= @seller.id %> > tbody").append(`
  <tr data-seller-id="<%= @seller.id %>" data-type-material="<%= @type_material.id %>">
      <td><%= @type_material.name %></td>
      <td><button type="button" id="delete_type_material" class="btn btn-danger">-</button></td>
  </tr>
  `);
notifsTempo("Ajout réussi", 4000, "green");
