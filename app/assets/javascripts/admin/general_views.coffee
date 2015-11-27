@view_task_details = (group_id) ->
  $.ajax '/admin/general_view/' + group_id + '/view_tasks',
    type: 'GET'
    dataType: 'script'

$(document).on 'click', '.row-selected', ->
  $('.row-selected').removeClass('checked')
  $(this).addClass('checked')
