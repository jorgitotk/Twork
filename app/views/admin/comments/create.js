$('#listing-comments-<%= @task.id %>').html('<%=escape_javascript render partial: "admin/general_view/list_comments", locals: { task: @task } %>');
$("#body-comment-form").val('')