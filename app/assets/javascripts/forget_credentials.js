$(document).ready(function(){
  $(document).on('click', '#retrieve_credentials', function(){
    $.email = $('#email').val();
    retrieveCredentialsAjaxCall($.email);
  });

  $(document).on('keyup', '#email', function(){
    $.email = $(this).val();
    retrieveCredentialsAjaxCall($.email);
  });
});


function retrieveCredentialsAjaxCall(email){
  $.ajax({
    url: '/sessions/retrieve_credentials',
    type: 'POST',
    dataType: 'script',
    data: {
      email: email
    },
    statusCode: {
      200: function(jqXHR){
        notifSuccess(jqXHR.responseText);
      },
      422: function(jqXHR){
        notifError(jqXHR.responseText);
      }
    }
  });
}
