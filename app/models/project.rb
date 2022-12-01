class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :project_status
end
