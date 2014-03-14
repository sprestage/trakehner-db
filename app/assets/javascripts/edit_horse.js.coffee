
$ ->

  $('#add_new_photo_button').click ->
    # alert('add photo button clicked')
    photo_container_template = $('#template_container .photo_display_container')
    new_photo_container = photo_container_template.clone()
    $('#photo_entries_container').append(new_photo_container)
    new_photo_container.show()