$(document).ready(function(){
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

  // Assignment of the incident to an technician
  $(document).on('change', '#incident_tech_id', function(){
    $.incident_id = $(this).attr("data_id");
    $.tech_id = $(this).val();
    $.ajax({
      url: '/incidents/' + $.incident_id,
      type: 'PUT',
      dataType: 'SCRIPT',
      data: {
        incident: {
          tech_id: $.tech_id
        }
      },
      error: function(jqXHR){
        notifError(JSON.parse(jqXHR.responseText)[0])
      },
      success: function(jqXHR){
        notifSuccess();
      }
    });
  });

});
