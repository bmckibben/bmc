class Task < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :task_status

	validates :name, presence: true
	scope :ordered, -> { order(start_at: :desc) }

	broadcasts_to -> (task) {[task.user,"tasks"]}, inserts_by: :prepend

end
