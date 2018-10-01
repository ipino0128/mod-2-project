class ProjectBacking < ApplicationRecord
  belongs_to :project_backer, :class_name => "User"
  belongs_to :backed_project, :class_name => "Project" 

end
