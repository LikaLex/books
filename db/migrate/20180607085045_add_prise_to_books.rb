class AddPriseToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :price, :decimal
  end
end
