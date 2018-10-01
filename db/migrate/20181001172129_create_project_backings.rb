class CreateProjectBackings < ActiveRecord::Migration[5.2]
  def change
    create_table :project_backings do |t|
      t.integer :project_backer_id
      t.integer :backed_project_id

      t.timestamps
    end
  end
end
