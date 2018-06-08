class AddPublicationYearToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :publication_year, :integer
  end
end
