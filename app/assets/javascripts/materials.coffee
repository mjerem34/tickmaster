# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#SelectTypeMaterial', (evt) ->
    $.ajax '/materials/redefine_type_material',
      type: 'GET',
      dataType: 'script',
      data: {
        type_material_name: $('#SelectTypeMaterial option:selected').text()
      }

$ ->
  $(document).on 'change', '#SelectSellers', (evt) ->
    $.ajax '/materials/redefine_seller_selected',
      type: 'GET',
      dataType: 'script',
      data: {
        id_seller: $('#SelectSellers option:selected').val()
      }
      error: (result) ->
        $("#fields-sellers").empty().html("
        <div class='row'>
          <div class='col-md-4' id='fields-sellers-titles'>
              <input type='text' name='name' value='' class='form-control' placeholder='Nom'><br>
          </div>
          <div class='col-md-4' id='fields-sellers-values'>
              <input type='text' name='name' value='' class='form-control' placeholder='Valeur'><br>
          </div>
        </div>

        <div class='row'>
          <div class='col-md-8'>
            <button type='button' name='button' class='btn btn-success' id='add-fields-sellers' style='width:100%;'>+</button>
          </div>
        </div>
      ");


$ ->
  $(document).on 'change', '#SelectDetentorType', (evt) ->
    $.ajax '/materials/redefine_detentor_type',
      type: 'GET',
      dataType: 'script',
      data: {
        id_detentor: $('#SelectDetentorType option:selected').val()
      }
