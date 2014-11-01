class AddLecturer < ActiveRecord::Migration
  def up
    add_column "university_events", "lecturer", :string
  end
  def down
    remove_column "university_events", "lecturer"
  end
end
