class AddAboutToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :about, :text
  end
end
