class AddAgeToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :age_id, :integer
  end
end
