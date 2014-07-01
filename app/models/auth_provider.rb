# == Schema Information
#
# Table name: auth_providers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  provider    :string(255)      not null
#  uid         :string(255)      not null
#  screen_name :string(255)
#  image_path  :string(255)
#  token       :string(255)
#  secret      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_auth_providers_on_user_id  (user_id)
#

class AuthProvider < ActiveRecord::Base
  belongs_to :user
  validates :provider, presence: true
  validates :uid, presence: true
end
