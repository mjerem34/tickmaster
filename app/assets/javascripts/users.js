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
        agency: {
          pseudo: $("input[name='user_pseudo']").val(),
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

  // INSCRIPTION FORM
  // Cache le champ mot de passe à l'ouverture de la page
  $("#user_password").hide();
  // Le rempli d'un espace car mot de passe par défaut : " "
  $("#user_password").val(' ');
  $("#user_name").change(function () {
    // Copie les prenoms et noms dans email et pseudo automatiquement
    $("#user_email").val($("#user_email").val() + "." + $("#user_name").val().toLowerCase());
    $("#user_email").val(removeDiacritics($("#user_email").val()));
    $("#user_pseudo").val($("#user_pseudo").val() + "." + $("#user_name").val().toLowerCase());
    $("#user_pseudo").val(removeDiacritics($("#user_pseudo").val()));
  });
  $("#user_surname").change(function () {
    // Copie les prenoms et noms dans email et pseudo automatiquement
    $("#user_email").val($("#user_surname").val().toLowerCase());
    $("#user_email").val(removeDiacritics($("#user_email").val()));
    $("#user_pseudo").val($("#user_surname").val().toLowerCase());
    $("#user_pseudo").val(removeDiacritics($("#user_pseudo").val()));
  });
  $(document).on('change', '#user_type_user_id', function(){
    // Vérifie si le type_user est sécurisé ( a besoin d'un mdp ) et ajout le champ mdp ou l'enleve
    if ($(this).children('option:selected').data('secure') == true){
      $("#user_password").show(250);
      $("#user_password").val('');
      $('.br-to-remove').remove();
      $("#user_password").before("<br class='br-to-remove'>");
    }else{
      $("#user_password").hide(250);
      $("#user_password").val(' ');
      $('.br-to-remove').remove();
    }
  });
  // # new.html.erb click signup button
  $(document).on("click", "button[name='signup']", function(){
    var surname = $('input#user_surname').val();
    var name = $('input#user_name').val();
    var pseudo = $('input#user_pseudo').val();
    var email = $('input#user_email').val();
    var tel = $('input#user_tel').val();
    var type_user_id = $('select#user_type_user_id option:selected').val();
    var agency_id = $('select#user_agency_id option:selected').val();
    var password = $('input#user_password').val();
    if (isEmptyString(surname)) {
      swal(':(', 'Veuillez remplir le champ "Prénom"', 'warning');
    } else if (isEmptyString(name)) {
      swal(':(', 'Veuillez remplir le champ "Nom"', 'warning');
    } else if(isEmptyString(pseudo)) {
      swal(':(', 'Veuillez remplir le champ "Pseudonyme"', 'warning');
    } else if(isEmptyString(email)) {
      swal(':(', 'Veuillez remplir le champ "Email"', 'warning');
    } else if(!validateEmail(email)) {
      swal(':(', 'L\'email n\'est pas valide', 'warning');
    } else if(isEmptyString(tel)) {
      swal(':(', 'Veuillez remplir le champ "Téléphone"', 'warning');
    } else if(isEmptyString(password)) {
      swal(':(', 'Veuillez remplir le champ "Mot de passe"', 'warning');
    } else if(type_user_id == '') {
      swal(':(', 'Veuillez choisir un type d\'utilisateur', 'warning');
    } else if(agency_id == '') {
      swal(':(', 'Veuillez choisir une agence', 'warning');
    }else {
      $.ajax({
        url: '/users',
        type: 'POST',
        dataType: 'script',
        data: {
          user: {
            surname: surname,
            name: name,
            pseudo: pseudo,
            email: email,
            tel: tel,
            type_user_id: type_user_id,
            agency_id: agency_id,
            password: password
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
});
