class Task < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :task_status
end
