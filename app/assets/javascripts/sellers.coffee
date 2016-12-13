# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'click', '#add_type_material', (evt) ->
    $.ajax '/sellers/get_all_type_materials',
      type: 'GET',
      dataType: 'script',
      data: {
        seller_id: $(this).parent().parent().parent().data('sellerid')
      }

$ ->
  $(document).on 'click', '#add_field_seller', (evt) ->
    $.ajax '/sellers/get_all_field_sellers',
      type: 'GET',
      dataType: 'script',
      data: {
        seller_id: $(this).data('sellerid')
      }
