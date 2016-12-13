$ ->
  # This is for CREATE an new specs_material by press enter touch with input in focus
  $(document).on 'keyup', '#value_new_specs_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/specs_materials',
        type: 'POST',
        dataType: 'script',
        data: {
          specs_material: {
            spec_value: $(this).val(),
            specs_types_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()


  # This is for CREATE an new specs_material by click on green button
  $(document).on 'click', '#create_new_specs_material', (evt) ->
    $.ajax '/specs_materials',
      type: 'POST',
      dataType: 'script',
      data: {
        specs_material: {
          spec_value: $("#value_new_specs_material").val(),
          specs_types_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
        }
      }
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for DELETE an specs_material by click on red button
  $(document).on 'click', '#delete_specs_materials', (evt) ->
    $.ajax '/specs_materials/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for UPDATE an specs_material by press enter with input in focus
  $(document).on 'keyup', 'input#input_spec_material', (evt) ->
    if evt.keyCode == 13
      $.ajax '/specs_materials/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          specs_material: {
            spec_value: $(this).val(),
            specs_types_material_name: $(this).parent().parent().children('td').children('select').find(':selected').text()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()
