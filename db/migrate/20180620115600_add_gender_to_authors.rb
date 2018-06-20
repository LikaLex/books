class AddGenderToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :gender_id, :integer
  end
end
