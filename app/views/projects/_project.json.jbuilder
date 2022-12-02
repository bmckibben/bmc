json.extract! project, :id, :name, :description, :start_at, :end_at, :user_id, :product_id, :project_status_id, :created_at, :updated_at
json.url project_url(project, format: :json)
