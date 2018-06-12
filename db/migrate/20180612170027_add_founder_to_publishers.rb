class AddFounderToPublishers < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :founder, :text
  end
end
