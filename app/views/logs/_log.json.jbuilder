json.extract! log, :id, :description, :start_at, :end_at, :user_id, :task_id, :created_at, :updated_at
json.url log_url(log, format: :json)
