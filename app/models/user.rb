class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,  :validatable
  belongs_to :company
  has_many :tasks
  has_many :logs
  has_many :projects
  

  # def name
  # 	email.split("@").first.capitalize
  # end

end
