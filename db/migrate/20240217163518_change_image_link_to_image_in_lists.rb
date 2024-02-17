class ChangeImageLinkToImageInLists < ActiveRecord::Migration[7.1]
  def change
    rename_column :lists, :image_link, :image
  end
end
