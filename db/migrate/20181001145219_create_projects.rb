class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :funds_needed
      t.integer :funds_acquired, :default => 0
      t.string :image_url
      t.integer :creator_id
      t.integer :category_id

      t.timestamps
    end
  end
end
