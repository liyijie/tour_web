class AddPhotoTypeToImage < ActiveRecord::Migration
  def change
    add_column :images, :photo_type, :string
    add_index :images, :photo_type
  end
end
