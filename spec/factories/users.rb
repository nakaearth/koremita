# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :current_user, class: User do
    email 'test@gmail.com'
    password 'test1234'
    name 'test_user'
    uid '112233aabbcc'
    token 'rwgitewija1j214i912jj14i24j1jffkajrtuo1'
    provider 'facebook'

  end
end
