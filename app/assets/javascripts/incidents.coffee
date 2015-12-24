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

  #$(document).on 'change', '#incident_sous_category_id', (evt) ->
    #$.ajax '/incidents/:id/update_maxvalue_lvl_urgence',
    #  type: 'GET',
    #  dataType: 'script',
    #  data: {
    #    sous_category_id: $('#incident_sous_category_id option:selected').val()
    #  }
    #  error: (jqXHR, textStatus, errorThrown) ->
    #    console.log("AJAX Error: #{textStatus}, #{jqXHR}, #{errorThrown}")
    #  success: (data, textStatus, jqXHR) ->
    #    console.log("Dynamic sous category select OK!")
