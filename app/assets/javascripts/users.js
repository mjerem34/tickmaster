$(document).ready(function(){
  // PROFIL.html.erb
  $(document).on('click', "button[name='send-form']", function(){
    var dataUserComp = {};
    $.each($(".field_user_value"), function (index, input) {
      dataUserComp[input.name] = input.value;
    });
    $.ajax({
      url: '/users/'+ $(this).data("id"),
      type: 'PUT',
      dataType: 'script',
      data: {
        user: {
          email: $("input[name='user_email']").val(),
          name: $("input[name='agency_name']").val(),
          surname: $("input[name='user_surname']").val(),
          tel: $("input[name='user_tel']").val(),
          type_user_id: $("input[name='type_user']").val(),
          agency_id: $("select#user_agency option:selected").text()
        },
        dataUserComp: dataUserComp
      },
      error: function(jqXHR){
        notifError(jqXHR.responseText);
      },
      success: function(jqXHR){
        notifSuccess(jqXHR.responseText);
      }
    });
  });

  // # new.html.erb click signup button
  $(document).on("click", "button[name='signup']", function(){
    var surname = $('input#user_surname').val();
    var name = $('input#user_name').val();
    var email = $('input#user_email').val();
    var tel = $('input#user_tel').val();
    var type_user_id = $('select#user_type_user_id option:selected').val();
    var agency_id = $('select#user_agency_id option:selected').val();
    var password = $('input#user_password').val();
    var password_confirmation = $('input#user_password_confirmation').val();
    if (isEmptyString(surname)) {
      swal(':(', 'Veuillez remplir le champ "Prénom"', 'warning');
    } else if (isEmptyString(name)) {
      swal(':(', 'Veuillez remplir le champ "Nom"', 'warning');
    } else if(isEmptyString(email)) {
      swal(':(', 'Veuillez remplir le champ "Email"', 'warning');
    } else if(!validateEmail(email)) {
      swal(':(', 'L\'email n\'est pas valide', 'warning');
    } else if(isEmptyString(tel)) {
      swal(':(', 'Veuillez remplir le champ "Téléphone"', 'warning');
    } else if(type_user_id == '') {
      swal(':(', 'Veuillez choisir un type d\'utilisateur', 'warning');
    } else if(agency_id == '') {
      swal(':(', 'Veuillez choisir une agence', 'warning');
    } else if(isEmptyString(password)) {
      swal(':(', 'Veuillez remplir le champ "Mot de passe"', 'warning');
    } else if(isEmptyString(password_confirmation)) {
      swal(':(', 'Veuillez remplir le champ "Confirmation de mot de passe"', 'warning');
    }else {
      $.ajax({
        url: '/users',
        type: 'POST',
        dataType: 'script',
        data: {
          user: {
            surname: surname,
            name: name,
            email: email,
            tel: tel,
            type_user_id: type_user_id,
            agency_id: agency_id,
            password: password,
            password_confirmation: password_confirmation
          }
        },
        statusCode: {
          201: function(jqXHR){
            swal(jqXHR.responseText, 'Veuillez patienter...', 'success');
            setTimeout(function(){
              window.location = '/';
            }, 2000);
          },
          422: function(jqXHR){
            swal(':(', jqXHR.responseText, 'error');
          }
        }
      });
    }
  });

  $(document).on("click", "button[name='edit_profile']", function(){
    var id = $(this).data('id');
    var surname = $('input#user_surname').val();
    var name = $('input#user_name').val();
    var email = $('input#user_email').val();
    var tel = $('input#user_tel').val();
    var type_user_id = $('select#user_type_user_id option:selected').val();
    var agency_id = $('select#user_agency_id option:selected').val();
    var password = $('input#user_password').val();
    var password_confirmation = $('input#user_password_confirmation').val();
    if (isEmptyString(surname)) {
      swal(':(', 'Veuillez remplir le champ "Prénom"', 'warning');
    } else if (isEmptyString(name)) {
      swal(':(', 'Veuillez remplir le champ "Nom"', 'warning');
    } else if(isEmptyString(email)) {
      swal(':(', 'Veuillez remplir le champ "Email"', 'warning');
    } else if(!validateEmail(email)) {
      swal(':(', 'L\'email n\'est pas valide', 'warning');
    } else if(isEmptyString(tel)) {
      swal(':(', 'Veuillez remplir le champ "Téléphone"', 'warning');
    } else if(type_user_id == '') {
      swal(':(', 'Veuillez choisir un type d\'utilisateur', 'warning');
    } else if(agency_id == '') {
      swal(':(', 'Veuillez choisir une agence', 'warning');
    }else {
      $.ajax({
        url: '/users/' + id ,
        type: 'PUT',
        dataType: 'script',
        data: {
          user: {
            surname: surname,
            name: name,
            email: email,
            tel: tel,
            type_user_id: type_user_id,
            agency_id: agency_id,
            password: password,
            password_confirmation: password_confirmation
          }
        },
        statusCode: {
          200: function(jqXHR){
            swal("Profil actualisé", 'Veuillez patienter...', 'success');
            setTimeout(function(){
              location.reload();
            }, 2000);
          },
          422: function(jqXHR){
            swal(':(', JSON.parse(jqXHR.responseText)[0], 'error');
          }
        }
      });
    }
  });

  $(document).on('click', 'div.slideThree', function(){
    $.clicked = $(this);
    $.id = $(this).data('id');
    $.ajax({
      url: '/users/' + $.id,
      type: 'PUT',
      dataType: 'script',
      data: {
        user: {
          actif: !$.clicked.children("input").is(":checked")
        }
      },
      success: function(){
        if($.clicked.children('label').css("left") == "3px"){
          $.clicked.children('label').css("left", "43px");
          $.clicked.children('input[type="checkbox"]').prop('checked', true);
        }else{
          $.clicked.children('label').css("left", "3px");
          $.clicked.children('input[type="checkbox"]').prop('checked', false);
        }
        notifSuccess();
      },
      error: function(result){
        notifError(result.responseText);
      }
    });
  });
});
