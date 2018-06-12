class AddFoundationDateToPublishers < ActiveRecord::Migration[5.2]
  def change
    add_column :publishers, :foundation_date, :integer
  end
end
