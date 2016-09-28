$(".modal-body-specs").empty().html("
  <% unless @specs_types_materials.nil? %>
    <div id='fields-specs-types-materials'>
      <% @specs_types_materials.each do |stm|  %>
        <div class='row'>
          <div class='col-md-4' id='fields-specs-types-titles'>
            <input type='text' value='<%= j stm.name%>' disabled class='form-control'>
            <br>
          </div>
          <div class='col-md-4' id='fields-specs-types-values'>
            <input type='text' name='<%= j stm.name%>' class='form-control'>
            <br>
          </div>
          <div class='col-md-4'>
            <button class='btn btn-danger' id='btn-delete-row'>&#8211;</button>
            <br><br>
          </div>
        </div>
      <% end %>
    </div>
    <div class='row'>
      <div class='col-md-8'>
        <button type='button' name='button' class='btn btn-success' id='add-fields-specs-types' style='width:100%;'>+</button>
      </div>
    </div>
  <% end %>
");
