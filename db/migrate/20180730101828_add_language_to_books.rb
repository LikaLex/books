class AddLanguageToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :language, :text
  end
end
