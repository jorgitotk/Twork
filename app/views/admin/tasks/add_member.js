alert("Task was assigned successfully!");
$('#members-on-task-<%= @task.id %>').html('<%=escape_javascript render partial: "members_on_task", locals: { group: @group, task: @task } %>');
$('#modal-add-member-task-<%= @task_id %>').modal('hide');