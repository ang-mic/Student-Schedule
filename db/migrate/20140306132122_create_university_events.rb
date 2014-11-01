class CreateUniversityEvents < ActiveRecord::Migration
  def change
    create_table :university_events do |t|
      
      t.string :title, limit: 100, :null => false
      t.date :date, :null => false
      t.time :start_at, :null => false
      t.time :end_at, :null => false
      t.string :repeat_type, limit: 15, :null => false
      t.integer :repeat_frequency, :null => false
      t.string :colour, limit: 15, :null => false
      t.string :privacy, limit: 15, :null => false
      t.text :description, limit: 1000
      t.string :day, limit: 20, :null => false
      #group is attribute of Lab
      t.string :group, limit: 20
      t.string :type
      t.references :timetable
      t.references :course_module

      t.timestamps
    end
  end
end
