class CreateUser2 < ActiveRecord::Migration
  def change
    drop_table :users if ActiveRecord::Base.connection.table_exists? 'users'
    create_table :users do |t|
      t.string :email
      t.string :name
      t.timestamps
    end
    add_index :users, [:email], unique: true
  end
end
