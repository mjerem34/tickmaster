$(document).ready(function(){
  $(document).on('click', '#bind', function(){
    $.field_type_user_name = $(this).parent().parent().children().children("select#new_field_type_user").text();
    $.type_user_id = $(this).data("id-type-user");
    if( $.field_type_user_name != ""){
      $.ajax({
        url: '/type_users/' + $.type_user_id + '/bind_field_type_user',
        type: 'POST',
        dataType: 'script',
        data: {
          field_type_user_name: $.field_type_user_name
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        },
        success: function(jqXHR){
          $("table#table_field_type_user_" + $.type_user_id + " > tbody").append(`
            <tr id="` + jqXHR + `">
            <td>` + $.field_type_user_name + `</td>
            <td><button type="button" class="btn btn-flat btn-danger" id="remove_ftutu" data-type-user-id="` + $.type_user_id + `" data-field-type-user-id="` + jqXHR + `">-</button></td>
            </tr>
            `);
            notifSuccess();
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
        url: '/type_users/' + $.this.data('type-user-id') + '/unbind_field_type_user',
        type: 'DELETE',
        dataType: 'script',
        data: {
          field_type_user_id: $.this.data('field-type-user-id'),
          force: false
        },
        error: function(jqXHR){
          if (jqXHR.status == 401) {
            swal({
              title: 'Attention !',
              text: "Ce champ ne peut pas être supprimé car un ou plusieurs utilisateurs ont renseigné ce champ dans leur profil. Voulez-vous forcer cette suppression et supprimer les données de l'utilisateur ?",
              type: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: "Oui",
              cancelButtonText: "Non"
            }).then(function () {
              $.ajax({
                url: '/type_users/' + $.this.data('type-user-id') + '/unbind_field_type_user',
                type: 'DELETE',
                dataType: 'script',
                data: {
                  field_type_user_id: $.this.data('field-type-user-id'),
                  force: true
                },
                error: function(jqXHR){
                  notifError(jqXHR.responseText);
                }
              });
            })
          }else{
            notifError(jqXHR.responseText);
          }
        },
        success: function(){
          $("#table_field_type_user_" + $.this.data('type-user-id') + " > tbody > tr#" + $.this.data('field-type-user-id')).remove();
          notifSuccess();
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
          error: function(jqXHR){
            notifError(jqXHR.responseText);
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
        error: function(jqXHR){
          if($.clicked.children('label').css("left") == "3px"){
            $.clicked.children('label').css("left", "43px");
            $.clicked.children('input[type="checkbox"]').prop('checked', true);
          }else{
            $.clicked.children('label').css("left", "3px");
            $.clicked.children('input[type="checkbox"]').prop('checked', false);
          }
          alert(jqXHR.responseText);
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
        rights[$(this).val()] = $(this).is(":checked");
      });
      $.ajax({
        url: '/type_users',
        type: 'POST',
        dataType: 'script',
        data: {
          type_user: {
            name: typeUserName,
            secure: secure,
            is_tech: tech,
            actif: actif,
          },
          rights: rights
        },
        error: function(jqXHR){
          notifError(jqXHR.responseText);
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
      title: 'Êtes vous sûr ?',
      text: "Cette action est irréversible",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Oui',
      cancelButtonText: 'Annuler'
    }).then(function () {
      $.ajax({
        url: '/type_users/' + typeUserId,
        type: 'delete',
        error: function(jqXHR){
          notifError(jqXHR.responseText);
        }
      });
    })
  });
