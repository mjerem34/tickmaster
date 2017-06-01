$(document).ready(function(){
  $(document).on('click', '#forget_credentials', function(){
    swal({
      title: 'Entrez votre adresse email et nous vous enverrons votre pseudonyme :)',
      input: 'email',
      showCancelButton: true,
      confirmButtonText: 'Envoyer',
      cancelButtonText: 'Annuler',
      showLoaderOnConfirm: true,
      preConfirm: function (email) {
        $.ajax({
          url: '/sessions/retrieve_credentials',
          type: 'POST',
          dataType: 'script',
          data: {
            email: email
          },
          statusCode: {
            200: function(jqXHR){
              swal({
                type: 'success',
                title: 'Merci ! :)',
                html: jqXHR.responseText
              });
            },
            404: function(jqXHR){
              swal({
                type: 'error',
                title: 'Oh non ... :(',
                html: jqXHR.responseText
              });
            }
          }
        });
      },
      allowOutsideClick: false
    });
  });
});
