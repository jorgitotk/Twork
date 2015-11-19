@view_tasks = (group_id) ->
  $.ajax '/admin/tasks/' + group_id + '/tasks_management',
    type: 'GET'
    dataType: 'script'

@close_modal_new_task = ->
	$('#modal-add-task').modal('hide');

@close_modal_edit_task = (id) ->
	$('#modal-edit-task-'+id).modal('hide');

$(document).on 'click', '.task-selected', ->
  $('.task-selected').removeClass('checked')
  $(this).addClass('checked')