class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      # t.string :email, limit: 50, :null => false, :unique => true
      # t.string :password, limit: 50, :null => false
      t.string :first_name, limit: 25, :null => false 
      t.string :last_name, limit: 25, :null => false
      t.string :student_number, limit: 15, :null => false, :unique => true
      t.integer :level, :null => false
      t.date :date_of_birth
      t.string :telephone_number, limit: 25
      t.references :course
      t.timestamps
    end
    # add_index :students, :email, unique: true
    add_index :students, :student_number, unique: true
  end
end
