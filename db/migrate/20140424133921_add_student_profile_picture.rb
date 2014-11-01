class AddStudentProfilePicture < ActiveRecord::Migration
  def self.up
    add_attachment :students, :profile_picture
  end

  def self.down
    remove_attachment :students, :profile_picture
  end

end
