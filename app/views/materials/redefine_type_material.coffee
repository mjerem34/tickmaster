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
