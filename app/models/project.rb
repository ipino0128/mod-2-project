class Project < ApplicationRecord
  has_many :project_backings, :foreign_key => :backed_project_id
  has_many :backers, through: :project_backings, :source => :project_backer
  belongs_to :creator, :class_name => "User"
end
