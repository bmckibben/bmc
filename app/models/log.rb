class Log < ApplicationRecord
  belongs_to :user
  belongs_to :task


	validates :name, presence: true
	scope :ordered, -> { order(start_at: :desc) }

	broadcasts_to -> (log) {[log.user,"tasks"]}, inserts_by: :prepend

end
