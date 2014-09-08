class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :acces_token
     t.references :user, index: true, null: false
      t.timestamps
    end
  end
end
