$ ->
  # This is for CREATE an new field_agency by press enter touch with input in focus
  $(document).on 'keyup', '#name_new_field_agency', (evt) ->
    if evt.keyCode == 13
      $.ajax '/field_agencies',
        type: 'POST',
        dataType: 'script',
        data: {
          field_agency: {
            name: $(this).val()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()


  # This is for CREATE an new field_agency by click on green button
  $(document).on 'click', '#create_new_field_agency', (evt) ->
    $.ajax '/field_agencies',
      type: 'POST',
      dataType: 'script',
      data: {
        field_agency: {
          name: $("#name_new_field_agency").val()
        }
      }
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for DELETE an field_agency by click on red button
  $(document).on 'click', '#delete_field_agency', (evt) ->
    $.ajax '/field_agencies/' + $(this).parent().parent().attr('id'),
      type: 'DELETE',
      error: (jqXHR, textStatus, errorThrown) ->
        $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
        delay = (ms, func) -> setTimeout func, ms
        delay 4000, ->  $('.notifs-tempo').remove()

  # This is for UPDATE an field_agency by press enter with input in focus
  $(document).on 'keyup', 'input#input_field_agency', (evt) ->
    if evt.keyCode == 13
      $.ajax '/field_agencies/'+ $(this).parent().parent().attr('id'),
        type: 'PUT',
        dataType: 'script',
        data: {
          field_agency: {
            name: $(this).val()
          }
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("body").append("<div class='notifs-tempo notif-destroy'><p>" + jqXHR.responseText + "</p></div>");
          delay = (ms, func) -> setTimeout func, ms
          delay 4000, ->  $('.notifs-tempo').remove()
