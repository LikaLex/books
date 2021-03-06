class AddAttachmentAuthorAvatarToAuthors < ActiveRecord::Migration[5.2]
  def self.up
    change_table :authors do |t|
      t.attachment :author_avatar
    end
  end

  def self.down
    remove_attachment :authors, :author_avatar
  end
end
