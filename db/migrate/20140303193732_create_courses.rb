class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, limit: 100, :null => false 
      t.string :short_title, limit: 15, :null => false
       t.string :code, limit: 15, :null => false 
      t.integer :number_of_levels, :null => false
      t.string :category, limit: 15, :null => false
      t.references :department
      t.timestamps
    end
    add_index :courses, :code, unique: true
    add_index :courses, :short_title
  end
end
