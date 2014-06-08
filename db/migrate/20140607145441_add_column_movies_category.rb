class AddColumnMoviesCategory < ActiveRecord::Migration
  def change
   add_column :movies, :category, :string, null: :false, after: :rate
  end
end
