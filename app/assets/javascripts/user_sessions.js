$(document).ready(function(){
  $(document).on('click', '#forget_credentials', function(){
    swal({
      title: ':)',
      text: 'Entrez votre adresse email et nous vous enverrons les instructions pour changer votre mot de passe ',
      input: 'email',
      showCancelButton: true,
      confirmButtonText: 'Envoyer',
      cancelButtonText: 'Annuler',
      showLoaderOnConfirm: true,
      preConfirm: function (email) {
        $.ajax({
          url: '/password_resets',
          type: 'POST',
          dataType: 'script',
          data: {
            email: email
          },
          statusCode: {
            200: function(jqXHR){
              swal({
                type: 'success',
                title: 'Vous pouvez aller dans votre boîte mail ! :)',
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
