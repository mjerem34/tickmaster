$(".modal-body-specs").empty().html("
  <div class='row'>
    <div class='col-md-8' id='SelectMaterialDiv'>
    <%= j select_tag 'SelectMaterial', options_for_select(@materials.collect{|material| [material.name.titleize, material.id]}), {class: 'dropdownSearchCreate'} %><br><br>
        <script>
          $('#SelectMaterial').selectize({create: true, persist: false});
        </script>
      </div>
  </div>

  <div id='fields-specs-types-materials'>
    <% @material_specs.keys.each do |ms| %>
    <div class='row'>
      <div class='col-md-4' id='fields-specs-types-titles'>
        <input type='text' value='<%= ms.to_s %>' disabled class='form-control'>
        <br>
      </div>
      <div class='col-md-4' id='fields-specs-types-values'>
        <input type='text' name='<%= @material_specs[ms].to_s %>' class='form-control' value='<%= @material_specs[ms].to_s %>'>
        <br>
      </div>
      <div class='col-md-4' id='div-btns-delete-row'>
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
");
