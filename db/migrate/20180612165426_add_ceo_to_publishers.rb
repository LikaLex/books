class AddCeoToPublishers < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :ceo, :text
  end
end
