class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.string :title, limit: 100, :null => false
      t.date :date, :null => false
      t.time :start_at, :null => false
      t.time :end_at, :null => false
      t.string :repeat_type, limit: 15, :null => false
      t.integer :repeat_frequency, :null => false
      t.string :colour, limit: 15, :null => false
      t.string :privacy, limit: 15, :null => false
      t.text :description, limit: 1000
      t.references :eventable, polymorphic: true

      t.timestamps
    end
  end
end
