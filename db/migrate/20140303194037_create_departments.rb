class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, limit: 50, :null => false,  :unique => true
      t.string :school, limit: 50, :null => false,  :unique => true

      t.timestamps
    end
    add_index :departments, :name
  end
end
