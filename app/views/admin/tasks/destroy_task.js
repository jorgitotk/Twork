$('.tasks-on-group').html('<%=escape_javascript render partial: "current_tasks", locals: { group: @group } %>');
