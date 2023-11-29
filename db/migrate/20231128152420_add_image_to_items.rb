class AddImageToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :image, :string
  end
end
