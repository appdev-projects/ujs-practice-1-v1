json.extract! task, :id, :owner_id, :status, :body, :created_at, :updated_at
json.url task_url(task, format: :json)
