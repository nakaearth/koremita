class AddColumnUserProviderUidToken < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :uid, :string, null: false, length: 256, default: ""
    add_column :users, :name, :string, null: false, length: 30 , default: ""
    add_column :users, :token, :strging, null: false, default: ""
  end
end
