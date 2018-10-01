class User < ApplicationRecord
  ###associations
  has_many :project_backings, :foreign_key => :project_backer_id
  has_many :backed_projects, through: :project_backings
  has_many :created_projects, :foreign_key => :creator_id, :class_name => "Project"

  ###validations
  validates :username, uniqueness: true

  has_secure_password


  def full_name
    "#{first_name} #{last_name}"
  end
  
end
