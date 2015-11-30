json.array!(@file_tasks) do |file_task|
  json.extract! file_task, :id, :image, :title
  json.url file_task_url(file_task, format: :json)
end
