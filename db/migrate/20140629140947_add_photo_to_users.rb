class AddPhotoToUsers < ActiveRecord::Migration
  def change
    add_column :movies, :photo, :string, after: :description
    remove_column :movies, :image_url
  end
end
