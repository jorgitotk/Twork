@view_details = (group_id) ->
  $.ajax '/admin/work_groups/' + group_id + '/members_management',
    type: 'GET'
    dataType: 'script'

$(document).on 'click', '.row-selected', ->
  $('.row-selected').removeClass('checked')
  $(this).addClass('checked')
