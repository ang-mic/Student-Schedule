class Room < ActiveRecord::Migration
  def up
    add_column "university_events", "room", :string
  end
  def down
    remove_column "university_events", "room"
  end
end
