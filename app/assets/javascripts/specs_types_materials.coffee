$ ->
  # This is for CREATE an new spec_type_materials by press enter touch with input in focus
  $(document).on 'keyup', '#name_new_specs_types_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/specs_types_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          specs_types_material: {
            name: $(this).val()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()


  # This is for CREATE an new spec_type_materials by click on green button
  $(document).on 'click', '#create_new_specs_types_material', (evt) ->
    $.ajax '/specs_types_materials',
      type: 'POST',
      dataType: 'script',
      data: {
        specs_types_material: {
          name: $("#name_new_specs_types_material").val()
        }
      }
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for DELETE an spec_type_materials by click on red button
  $(document).on 'click', '#delete_specs_types_material', (evt) ->
    $.ajax '/specs_types_materials/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for UPDATE an spec_type_materials by press enter with input in focus
  $(document).on 'keyup', 'input#input_specs_types_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/specs_types_materials/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          specs_types_material: {
            name: $(this).val()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()
