class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
       
      t.timestamps
    end
    add_reference :comments, :user, index: true
    add_reference :comments, :movie, index: true
  end
end
