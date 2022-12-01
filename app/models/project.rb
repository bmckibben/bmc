class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :project_status
end
