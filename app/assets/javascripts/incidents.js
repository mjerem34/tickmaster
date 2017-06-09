$(document).ready(function(){
  // new.html.erb ---------------
  // Loading of sous_categories on the incident creation page
  $(document).on('change', '#incident_category_id', function(){
    $.category_id = $('#incident_category_id option:selected').val();
    $.ajax({
      url: '/categories/' + $.category_id,
      type: 'GET',
      success: function(jqXHR){
        $('#incident_sous_category_id').html('');
        $.each(jqXHR, function(index, el){
          $('#incident_sous_category_id').append('<option value=' + el.id + '>' + el.name + '</option>');
        });
      }
    });
  });


  // edit.html.erb --------------
  // Assignment of the incident to an technician
  $(document).on('change', '#incident_tech_id', function(){
    $.incident_id = $(this).data("id");
    $.tech_id = $(this).val();
    $.ajax({
      url: '/incidents/' + $.incident_id,
      type: 'PUT',
      dataType: 'SCRIPT',
      data: {
        incident: {
          tech_id: $.tech_id,
          incident_state_id_for_user_id: 2,
          incident_state_id_for_tech_id: 2
        }
      },
      statusCode: {
        422: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        200: function(jqXHR){
          notifSuccess();
        }
      }
    });
  });

  $(".direct-chat-messages").scrollTop($('.direct-chat-messages')[0].scrollHeight);
  $(document).on('click', '#send-response', function(){
    sendResponse();
  });
  $(document).on('keyup', 'input[name="message"]', function(e){
    if (e.keyCode == 13) {
      sendResponse();
    }
  });

  function sendResponse(responseContent, incidentId){
    $.responseContent = $('input[name="message"]').val();
    $.incidentId = $("#send-response").data('incident');
    $.currentUserName = $('.direct-chat').data('user');
    $.ajax({
      url: '/responses',
      type: 'POST',
      dataType: 'script',
      data: {
        response: {
          content: $.responseContent,
          incident_id: $.incidentId
        }
      },
      statusCode: {
        201: function(jqXHR){
          $('input[name="message"]').val("");
          $('.direct-chat-msg').last().after(`
            <div class="direct-chat-msg right">
            <div class="direct-chat-info clearfix">
            <span class="direct-chat-name pull-left">` + $.currentUserName + `</span>
            <span class="direct-chat-timestamp pull-right">` + jqXHR.responseText + `</span>
            </div>
            <div class="direct-chat-text">` + $.responseContent + `</div>
            </div>
            `);
            $(".direct-chat-messages").animate({ scrollTop: $('.direct-chat-messages').prop("scrollHeight")}, 1000);
          },
          422: function(jqXHR){
            notifError(JSON.parse(jqXHR.responseText)[0]);
          }
        }
      });

    }

    $(document).on('click', 'button[name="cloture_incidents"]', function(){
      $.id = $(this).data("id");
      $.ajax({
        url: "/incidents/" + $.id + "/cloture",
        type: "DELETE",
        dataType: "script",
        statusCode: {
          200: function(){
            swal('Merci ! :)', "L'incident a été cloturé, veuillez patienter", 'success');
            seTimeout(function(){
              location.reload();
            }, 3000);
          },
          422: function(){
            swal("Une erreur s'est produite", "Veuillez contacter votre administrateur réseau", "error");
          }
        }
      });
    });
    $(document).on('click', 'button[name="reject_incidents"]', function(){
      swal({
        title: 'Êtes-vous sûr ?',
        text: "Avez vous donné une raison à ce rejet avant de cloturer ?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Cloturer',
        cancelButtonText: 'Annuler'
      }).then(function () {
        $.id = $(this).data("id");
        $.ajax({
          url: "/incidents/" + $.id + "/reject",
          type: "DELETE",
          dataType: "script",
          data: {
            incident: {
              incident_state_id_for_tech_id: 10,
              incident_state_id_for_user_id: 10
            }
          },
          statusCode: {
            200: function(){
              swal('Merci ! :)', "L'incident a bien été rejeté, veuillez patienter", 'success');
              seTimeout(function(){
                location.reload();
              }, 3000);
            },
            422: function(){

            }
          }
        });
      })
    });

    $(document).on('click', 'button[name="reaffect_incidents"]', function(){
      $.id = $(this).data("id");
      $.ajax({
        url: "/incidents/" + $.id,
        type: "PUT",
        dataType: "script",
        data: {
          incident: {
            tech_id: null,
            incident_state_id_for_user_id: 12,
            incident_state_id_for_tech_id: 12
          }
        },
        statusCode: {
          204: function(){
            swal('Merci ! :)', "Votre demande de reaffectation a bien été prise en compte", 'success');
            setTimeout(function(){
              window.location = '/';
            }, 2000);
          }
        }
      });
    });
  });
