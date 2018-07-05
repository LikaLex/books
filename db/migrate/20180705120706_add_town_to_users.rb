class AddTownToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :town, :text
  end
end
