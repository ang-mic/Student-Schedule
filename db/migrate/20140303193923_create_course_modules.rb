class CreateCourseModules < ActiveRecord::Migration
  def change
    create_table :course_modules do |t|
      t.string :title, limit: 100, :null => false
      t.string :code, limit: 15, :null => false
      t.string :lecturer, limit: 25, :null => false
      t.integer :level, :null => false
      t.references :course
      t.timestamps
    end
    add_index :course_modules, :title
    add_index :course_modules, :code, unique: true
  end
end
