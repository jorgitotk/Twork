$('#members-on-task-<%= @task.id %>').html('<%=escape_javascript render partial: "members_on_task", locals: { group: @group, task: @task } %>');
