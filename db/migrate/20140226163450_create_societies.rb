class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      # t.string :email, limit: 50, :null => false
      # t.string :password, limit: 50, :null => false
      t.string :name, limit: 50, :null => false
      t.string :category, limit: 50, :null => false
      t.text :descritpion

      t.timestamps
    end
    # add_index :societies, :email, unique: true
    add_index :societies, :name, unique: true
  end
end
