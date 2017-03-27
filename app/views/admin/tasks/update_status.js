$('#modal-detail-task-<%= @task.id %>').modal('hide');
$('.modal-backdrop').hide();
$('#detail-task-group').html('<%=escape_javascript render "admin/general_view/detail_task_group", group: @group %>');
$('#task_list').html('<%=escape_javascript render "front/tasks/tasks_list", future_tasks: @future_tasks, in_progress_tasks: @in_progress_tasks, done_tasks: @done_tasks %>');