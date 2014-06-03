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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth_provider do
    provider 'facebook'
    uid SecureRandom.urlsafe_base64(124)
    screen_name 'test_name'
    image_path 'http://test.image.url/test.jpg'
    token '123245aaaaaa'
    secret SecureRandom.urlsafe_base64(124)
  end
end
