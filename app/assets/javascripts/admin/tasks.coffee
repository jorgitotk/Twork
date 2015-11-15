@view_tasks = (group_id) ->
  $.ajax '/admin/tasks/' + group_id + '/tasks_management',
    type: 'GET'
    dataType: 'script'

@close_modal_new_task = ->
	$('#modal-add-task').modal('hide');