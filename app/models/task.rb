class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :task_status

  attr_accessor :task_time
	validates :name, presence: true
	scope :ordered, -> { order(start_at: :desc) }

	broadcasts_to -> (task) {[task.user,"tasks"]}, inserts_by: :prepend

	def duration
    #(end_at || Time.current.to_i) - start_at
    time = Log.where(task_id: self.id).sum('timestampdiff(MINUTE, start_at, end_at)')	
    return time * 60
  end

end
