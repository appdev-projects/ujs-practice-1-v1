json.extract! task, :id, :tasks, :tasks_count, :task_caption, :owner_id, :created_at, :updated_at
json.url task_url(task, format: :json)
