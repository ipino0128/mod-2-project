class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :description
      t.integer :funds_needed
      t.integer :funds_acquired
      t.integer :number_of_supporters
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
