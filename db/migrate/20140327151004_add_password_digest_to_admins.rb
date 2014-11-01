class AddPasswordDigestToAdmins < ActiveRecord::Migration
  def up
  	remove_column "admins", "password" 
  	add_column "admins", "password_digest", :string
  end
  def down
  	add_column "admins", "password" , :string, :limit => 25
  	remove_column "admins", "password_digest"
  end
end
