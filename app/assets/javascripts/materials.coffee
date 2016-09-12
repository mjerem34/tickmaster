# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#SelectTypeMaterial', (evt) ->
    $.ajax '/materials/redefine_type_material',
      type: 'GET',
      dataType: 'script',
      data: {
        type_material_id: $('#SelectTypeMaterial option:selected').val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAAX Error: #{textStatus}, #{jqXHR}, #{errorThrown}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic category select OK!")

$ ->
  $(document).on 'change', '#SelectSellers', (evt) ->
    $.ajax '/materials/redefine_seller_selected',
      type: 'GET',
      dataType: 'script',
      data: {
        id_seller: $('#SelectSellers option:selected').val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAAX Error: #{textStatus}, #{jqXHR}, #{errorThrown}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic category select OK!")
