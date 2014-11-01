class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :level
      t.integer :term
      t.date :start_at
      t.date :end_at
      t.string :academic_year, limit: 20
      t.references :course

      t.timestamps
    end
  end
end
