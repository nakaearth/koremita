class CreateYoutubs < ActiveRecord::Migration
  def change
    create_table :youtubs do |t|
      t.string :title
      t.string :url
      t.integer :movie_id

      t.timestamps
    end
  end
end
