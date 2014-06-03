class CreateAuthProviders < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.integer :user_id
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :screen_name
      t.string :image_path
      t.string :token
      t.string :secret

      t.timestamps
    end
    add_index :auth_providers, [:user_id]
  end
end
