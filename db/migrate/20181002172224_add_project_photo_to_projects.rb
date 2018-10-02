class AddProjectPhotoToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_photo, :string
  end
end
