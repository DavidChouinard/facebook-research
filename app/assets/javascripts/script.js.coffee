$ ->
  get_empty_field_count = ->
    count = 0

    $('#user_list').find('.annotation_facebook_name').each ->
      if $(this).val() == ""
        if count >= 1
          $(this).parent().parent().remove()
        else
          count++

    return count

  $('#user_list').on 'keypress', '.annotation_facebook_name', ->
    empty_field_count = get_empty_field_count()

    if empty_field_count == 0
      email_field_number = $("#user_list").children().size()
      if email_field_number < 10
        new_field = $("#user_list").children('tr').first().clone()
        new_field.find('input').val('')
        $('.annotation_facebook_name', new_field).autocomplete({
          source: friends,
          select: (event, ui) ->
            $(this).siblings('.annotation_facebook_id').val(ui.item.id)
        })

        $("#user_list").append(new_field)

  $("#new_annotation").validate()

    #//If we have no empty fields, create a new one
    #if (empty_field_count === 0) {
      #var total_field_number = multiuser_list.children().size();
      #if (total_field_number < 10) {
        #var new_field = multiuser_list.children('tr').first().clone();
        #var field_number = multiuser_list.children().size();
        #var field_name = /(.*)_[0-9]+/.exec($(this).attr('id'))[1];

        #new_field.find('input').val('');

        #// Increment all the IDs
        #new_field.find('input').attr('id', field_name + '_' + field_number).attr('name', field_name + '_' + field_number).attr('onkeyup', function (i, attr) {
          #return attr.replace(/(.*['"].*_)[0-9]+(.*)/, '$1' + field_number + '$2');
        #}).hint();
        #new_field.find('label.form_label').attr('id', field_name + '_' + field_number + '_label').append('<img src="/images/delete.png" class="small-button springforms-multiuser-remove"/>');
        #new_field.children('td').last().attr('id', field_name + '_' + field_number + '_status').removeClass('form_checkmark form_exmark');

        #// Anything else we need to do on the new field?
        #// If mutliuser_field_initialize exists, call it with the correct scope
        #if (typeof multiuser_field_initialize !== "undefined")
          #multiuser_field_initialize.call(this, []);

        #multiuser_list.append(new_field);
      #}
    #}
  #});

  #$('.multiuser-list').on('click', '.springforms-multiuser-remove', function () {
    #$(this).parent().parent().parent().remove();
    #if ($(this).closest('.multiuser-list').children().size() <= 1)
      #$(this).remove();
  #});
#});
