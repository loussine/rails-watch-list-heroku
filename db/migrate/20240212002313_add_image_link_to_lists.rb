class AddImageLinkToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :image_link, :string
  end
end
