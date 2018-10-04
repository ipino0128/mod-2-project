class User < ApplicationRecord
  ###associations
  has_many :project_backings, :foreign_key => :project_backer_id
  has_many :backed_projects, through: :project_backings
  has_many :created_projects, :foreign_key => :creator_id, :class_name => "Project"

  ###validations
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create


  has_secure_password


  def full_name
    "#{first_name} #{last_name}"
  end

  def total_projects
    self.created_projects.count
  end

  def goal_reached_projects
    self.created_projects.select do |project|
      project.funds_acquired >= project.funds_needed
    end
  end


  def total_funds_acquired
    array = self.created_projects.map do |project|
      project.funds_acquired
    end
    array.inject(0){|sum,x| sum + x }
  end

  def total_funds_needed
    array = self.created_projects.map do |project|
      project.funds_needed
    end
    array.inject(0){|sum,x| sum + x }
  end

  def most_popular_project
    array = self.created_projects.max_by do |project|
      project.backers.count
    end
  end


end
