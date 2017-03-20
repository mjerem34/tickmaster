# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#incident_category_id', (evt) ->
    $.ajax '/incidents/:id/update_subcats',
      type: 'GET',
      dataType: 'script',
      data: {
        category_id: $('#incident_category_id option:selected').val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAAX Error: #{textStatus}, #{jqXHR}, #{errorThrown}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic category select OK!")

$ ->
  $(document).on 'change', '#incident_tech_id', (evt) ->
    $.ajax '/incidents/:id/send_tech_form',
     type: 'GET',
     dataType: 'script',
     data: {
       incident_id: $(this).attr("data_name")
       tech_id: $(this).val()
     }
     error: (jqXHR, textStatus, errorThrown) ->
       console.log("AJAX Error: #{textStatus}, #{jqXHR}, #{errorThrown}")
     success: (data, textStatus, jqXHR) ->
       console.log("Technicien attribué !")
