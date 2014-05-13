class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.integer :view_flag
      t.integer :rate
      t.integer :user_id

      t.timestamps
    end
  end
end
