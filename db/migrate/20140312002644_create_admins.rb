class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username, limit: 25
      t.string :password, limit: 25
      t.string :first_name, limit: 25
      t.string :last_name, limit: 25
      t.string :type
      t.timestamps
    end
     add_index :admins, :username, unique: true
  end
end
