$(document).ready(function(){

  // Creation of category by clicking on green button (+)
  $(document).on('click', 'tr.create_categories > td:nth-child(2) > button', function(){
    $.category_name = $('tr.create_categories > td:nth-child(1) > input').val();
    $.ajax({
      url: '/categories',
      type: 'POST',
      dataType: 'SCRIPT',
      data: {
        category: {
          name: $.category_name
        }
      },
      error: function(jqXHR){
        notifError(JSON.parse(jqXHR.responseText)[0]);
      },
      success: function(jqXHR){
        var category_id = JSON.parse(jqXHR)[0];
        var sous_category_id = JSON.parse(jqXHR)[1];
        notifSuccess();
        $('tr.create_categories').before(`
          <tr data-toggle="modal" data-target="#` + category_id + `">
          <td>` + $.category_name + `</td>
          <td></td>
          </tr>
          `);
          $('tr.create_categories > td:nth-child(1) > input').val('');
          $('table.categories').after(`
            <div class="container-modal">
            <div class="modal fade" id="` + category_id + `" role="dialog">
            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <i>Nom : </i>
            <i>Appuyez sur entrée pour éditer le nom de la catégorie</i>
            <h4 class="modal-title"><input type='text' name='name_category' class='form-control' data-id='` + category_id + `' value='` + $.category_name + `'/></h4>
            </div>
            <div class="modal-body">
            <i>Sous catégories : </i>
            <div class="table-responsive">
            <table class="table table-hover table-bordered sous_categories_` + category_id + `">
            <thead class="header">
            <tr>
            <th>Nom</th>
            <th></th>
            </tr>
            </thead>
            <tbody>
            <tr class='sous_categories'>
            <td><input type='text' name='sous_category_name' class='form-control' value='Autre'/></td>
            <td><input type='number' name='sous_category_lvl_urgence_max' class='form-control' min='0' max='10' value='10'/></td>
            <td><button type='button' name='destroy_sous_category' class='btn btn-flat btn-danger' data-id='` + sous_category_id + `'>-</button></td>
            </tr>
            <tr class='create_sous_categories'>
            <td><input type='text' name='sous_category_name' class='form-control' data-category="` + category_id + `" placeholder='Nom(Requis)'/></td>
            <td><input type='number' name='sous_category_lvl_urgence_max' class='form-control' step="1" value='1' min="1" max="10"/></td>
            <td><button type='button' name='create_button' class="btn btn-flat btn-success">+</button></td>
            </tr>
            </tbody>
            </table>
            </div>
            </div>
            <div class="modal-footer">
            <button type='button' name='button' class='btn btn-flat btn-danger' id='delete_category' data-id='` + category_id + `' data-dismiss="modal">Supprimer</button>
            </div>
            </div>
            </div>
            </div>
            </div>
            `);
          }
        });
      });

      // Creation of category on press enter with input in focus
      $(document).on('keyup', 'tr.create_categories > td:nth-child(1) > input', function(e){
        if(e.keyCode == 13){
          $(this).focusout();
          $('tr.create_categories > td:nth-child(2) > button').click();
        }
      });

      // Update the name of the category
      $(document).on('keyup', '.modal-title > input', function(e){
        if (e.keyCode == 13) {
          $.id = $(this).data('id');
          $.this = $(this);
          $.ajax({
            url: '/categories/' + $.id,
            type: 'PUT',
            dataType: 'script',
            data: {
              "category":{
                "name": $.this.val()
              }
            },
            error: function(jqXHR){
              notifError(JSON.parse(jqXHR.responseText)[0]);
            },
            success: function(jqXHR){
              notifSuccess();
              $('tr[data-target="#' + $.id + '"] > td:nth-child(1)').html($.this.val());
            }
          });
        }
      });

      // Destroy of category and all of its sous_categories on click on the red button (-)
      $(document).on('click', '#delete_category', function(){
        $.id = $(this).data('id');
        swal({
          title: 'Êtes-vous sur ?',
          text: "Vous ne pourrez pas annuler cette opération !",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          cancelButtonText: 'Annuler',
          confirmButtonText: 'Confirmer !'
        }).then(function () {
          $.ajax({
            url: '/categories/' + $.id,
            type: 'DELETE',
            error: function(jqXHR){
              notifError(JSON.parse(jqXHR.responseText)[0]);
            },
            success: function(jqXHR){
              notifSuccess();
              $('tr[data-target="#' + $.id + '"]').remove();
              $('.modal#' + $.id).parent().remove();
            }
          });
        })
      });
    });
