$("#table_sellers > tbody").append(`
  <tr id="<%= @seller.id %>">
    <td data-toggle="modal" data-target="#modal_<%= @seller.id %>"><%= @seller.name %></td>
    <td>
      <div class="slideThree etatVendeur">
        <%= @seller.actif ? "<input class='form-control' type='checkbox' value='actif' checked>".html_safe : "<input class='form-control' type='checkbox' value='actif'>".html_safe %>
        <label for="checkbox-right"></label>
      </div>
    </td>
  </tr>
  `);
$("#table_sellers").after(`
  <div class="container-modal modal-details-seller">
    <div class="modal fade" id="modal_<%= @seller.id %>" role="dialog">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Vendeur : </h4>
            <span class="seller_name"><h5 class="modal-title" data-seller="<%= @seller.id %>"><%= @seller.name%></h5><%= image_tag 'ICONS/1004.png', size: "20x20", class: "edit_img" %></span>
          </div>
          <div class="modal-body">
            <caption class='modal-body-title'>Informations :</caption>
            <table class="table table-hover" id="table_field_seller_<%= @seller.id %>">
              <thead>
                <tr>
                  <th>Champ</th>
                  <th>Valeur</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr data-seller-id='<%= @seller.id %>'>
                  <td><%= select_tag 'name_new_field_seller', options_for_select(@field_sellers.collect{|field_seller| [field_seller.name, field_seller.id]}), class: "dropdownSearchCreate" %></td>
                  <td><input type="text" name="name" value="" placeholder='Valeur' id='value_new_field_seller' class='form-control'></td>
                  <td><button type="button" name="button" class='btn btn-success' id='create_new_field_seller'>+</button></td>
                </tr>
                <% @seller.field_seller_sellers.each do |fss| %>
                <tr data-seller-id='<%= @seller.id %>' data-field-seller-id="<%= fss.field_seller.id %>">
                  <td><%= fss.field_seller.name %></td>
                  <td><input name="name" value="<%= fss.content %>" class="form-control" id="value_field_seller"/></td>
                  <td><button type="button" name="button" class="btn btn-danger" id="delete_field_seller">-</button></td>
                </tr>
                <% end %>
              </tbody>
            </table>
            <hr>
            <caption class='modal-body-title'>Types de matériels vendus :</caption>
            <table class="table table-hover" id="table_type_materials_sellers_<%= @seller.id %>">
              <thead class="header">
                <tr>
                  <th>Nom</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr data-seller-id="<%= @seller.id %>">
                  <td><%= select_tag 'name_new_type_material', options_for_select(@type_materials.collect{|type_material| [type_material.name, type_material.id]}), class: "dropdownSearchCreate" %></td>
                  <td><button type="button" name="button" class='btn btn-success' id='add_type_material'>+</button></td>
                </tr>
                <% @seller.type_material_sellers.each do |tms| %>
                  <tr data-seller-id="<%= @seller.id %>" data-type-material="<%= tms.type_material.id %>">
                      <td><%= tms.type_material.name %></td>
                      <td><button type="button" id="delete_type_material" class="btn btn-danger">-</button></td>
                  </tr>
                <% end %>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" name="button" class="btn btn-default" id="delete_seller" data-seller-id="<%= @seller.id %>">Supprimer</button>
            <button type="button" class="btn btn-danger close-modal" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
  </div>
`);
$("#modal_<%= @seller.id %>").find("select").selectize({create: true, persist: false, createOnBlur: true, closeAfterSelect: true, placeholder: "Merci de sélectionner une valeur"});
notifsTempo("Création réussie", 4000, 'green');
