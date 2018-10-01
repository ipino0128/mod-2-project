class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :age
      t.string :gender
      t.string :country
      t.string :occupation

      t.timestamps
    end
  end
end
