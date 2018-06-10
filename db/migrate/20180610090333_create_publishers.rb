class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
