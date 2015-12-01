$('#modal-detail-task-<%= @task.id %>').modal('hide');
$('.modal-backdrop').hide();
$('#detail-task-group').html('<%=escape_javascript render "admin/general_view/detail_task_group", group: @group %>');