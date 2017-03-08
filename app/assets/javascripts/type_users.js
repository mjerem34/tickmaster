$(document).ready(function(){
  $(document).on('click', '#add_field_type_user', function(){
    $.newFieldUser = $(this).parent().parent().children().children("select#new_field_type_user").text();
    var type_user_id = $(this).data("id-type-user");
    if( $.newFieldUser != ""){
      $.ajax({
        url: '/type_users/' + type_user_id + '/add_field_type_user',
        type: 'POST',
        dataType: 'script',
        data: {
          name: $.newFieldUser
        },
        error: function(result){
          notifError(result.responseText);
        }
      });
    }else{
      notifAlert("Merci de remplir tous les champs");
    }
  });

  // Supprimer Field type user liaison
  $(document).on('click', '#remove_ftutu', function(){
    $.this = $(this);
    $.ajax({
      url: '/type_users/' + $.this.data('type-user-id') + '/delete_field_type_user',
      type: 'DELETE',
      dataType: 'script',
      data: {
        field_type_user: {
          id: $.this.data('field-type-user-id')
        },
        force: false
      },
      error: function(result){
        if (result.status == 401) {
          swal({
            title: "Attention !",
            text: "Ce champ ne peut pas être supprimé car un ou plusieurs utilisateurs ont renseigné ce champ dans leur profil. Voulez-vous forcer cette suppression et supprimer les données de l'utilisateur ?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Oui",
            cancelButtonText: "Non",
            closeOnConfirm: true,
            closeOnCancel: true
          },
          function(isConfirm){
            if (isConfirm) {
              $.ajax({
                url: '/type_users/' + $.this.data('type-user-id') + '/delete_field_type_user',
                type: 'DELETE',
                dataType: 'script',
                data: {
                  field_type_user: {
                    id: $.this.data('field-type-user-id')
                  },
                  force: true
                },
                error: function(result){
                  notifError(result.responseText);
                }
              });
            } else {
              notifError("Impossible de supprimer le champ de type utilisateur car il contient des données associées.");
            }
          });
        }else{
          notifError(result.responseText);
        }
      }
    });
  });

  // Valide les changements quand on clique sur 'Entrée'
  // Récupère la variable $.dataTypeUser de la fonction au dessus
  // Ne pas séparer ces deux fonctions
  $(document).on('keyup','input[name="type_user_name_modal"]', function(e){
    if(e.keyCode == 13){
        $.ajax({
          url: '/type_users/' + $(this).data('type-user'),
          type: 'PUT',
          dataType: 'script',
          data: {
            type_user: {
              name: $(this).val()
            }
          },
          error: function(result){
            notifError(result.responseText);
          }
        });
    }
  });

  // Mise a jour des champs quand on clique sur le bouton oui/non
  // Controle les trois boutons en même temps et mets à jour les trois champs en même temps
  $(document).on("click", "div.tableRight", function(){
    $.clicked = $(this);
    var dataTypeUser = $.clicked.children('input[type="checkbox"]').data("type_user");
    if($.clicked.children('label').css("left") == "3px"){
      $.clicked.children('label').css("left", "43px");
      $.clicked.children('input[type="checkbox"]').prop('checked', true);
    }else{
      $.clicked.children('label').css("left", "3px");
      $.clicked.children('input[type="checkbox"]').prop('checked', false);
    }
    var secure = $("div.tableRight > input[value='secure'][data-type_user='" + dataTypeUser + "']").is(":checked");
    var is_tech = $("div.tableRight > input[value='is_tech'][data-type_user='" + dataTypeUser + "']").is(":checked");
    var actif = $("div.tableRight > input[value='actif'][data-type_user='" + dataTypeUser + "']").is(":checked");
    $.ajax({ // demarage ajax
      url: '/type_users/' + dataTypeUser, // url du controller rails
      type: 'PUT',
      dataType: 'script',
      data: {
        type_user:{
          secure: secure,
          is_tech: is_tech,
          actif: actif
        }
      },
      error: function(result){
        if($.clicked.children('label').css("left") == "3px"){
          $.clicked.children('label').css("left", "43px");
          $.clicked.children('input[type="checkbox"]').prop('checked', true);
        }else{
          $.clicked.children('label').css("left", "3px");
          $.clicked.children('input[type="checkbox"]').prop('checked', false);
        }
        alert(result.responseText);
      }
    });
  });

  // This is for save new user type with ajax
  var typeUserName;
  var secure;
  var tech;
  var actif;
  var rights = {};
  $('#choose_rights_new_type_user').click(function(){
    // Getting values
    typeUserName = $('input[name="new_type_user"]').val();
    secure = $('input[name="new_type_user_secure"]').is(":checked");
    tech = $('input[name="new_type_user_tech"]').is(":checked");

    // Fill form in modal
    $("input[name='new_type_user_modal']").val(typeUserName);
    $("input[name='new_type_user_secure_modal']").prop("checked", secure);
    $("input[name='new_type_user_tech_modal']").prop("checked", tech);
  });

  // Recharge la page quand on a créé un nouveau type utilisateur
  $(document).on('click', '#save_new_type_user', function(){
    typeUserName = $('input[name="new_type_user"]').val();
    secure = $('input[name="new_type_user_secure"]').is(":checked");
    tech = $('input[name="new_type_user_tech"]').is(":checked");
    actif = $('input[name="new_type_user_actif_modal"]').is(":checked");
    $(".right_access").each(function(){
      console.log($(this).val + " = " + $(this).is(":checked"));
      rights[$(this).val()] = $(this).is(":checked");
    });
    $.ajax({
      url: '/type_users',
      type: 'POST',
      dataType: 'script',
      data: {
        type_user_name: typeUserName,
        secure: secure,
        is_tech: tech,
        actif: actif,
        rights: rights
      },
      error: function(result){
          notifError(result.responseText);
      }
    });
  });

  // Controle et ajuste la valeur des checkbox par rapport à l'alignement du bouton Oui/Non
  $(document).on('click', '.slideThree', function(){
    if($(this).children('label').css("left") == "3px"){
      $(this).children('label').css("left", "43px");
      $(this).children('input[type="checkbox"]').prop('checked', true);
    }else{
      $(this).children('label').css("left", "3px");
      $(this).children('input[type="checkbox"]').prop('checked', false);
    }
  });
});


$(document).on('click', '#delete_type_user', function(){
  var typeUserId = $(this).data('type-user');
  swal({
    title: "Attention !",
    text: "Êtes vous sûr de vouloir supprimer ce type utilisateur ?",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Oui",
    cancelButtonText: "Non",
    closeOnConfirm: true,
    closeOnCancel: true
  },
  function(){
    $.ajax({
      url: '/type_users/' + typeUserId,
      type: 'delete',
      error: function(result){
        notifError(result.responseText);
      }
    });
  });
});
