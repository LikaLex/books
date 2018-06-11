class AddAttachmentPublisherAvatarToPublishers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :publishers do |t|
      t.attachment :publisher_avatar
    end
  end

  def self.down
    remove_attachment :publishers, :publisher_avatar
  end
end
