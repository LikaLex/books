class AddUserAboutToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_about, :text
  end
end
