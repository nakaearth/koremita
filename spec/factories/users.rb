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
    name 'test_user'
  end
  
  factory :other_user, class: User do
    email 'test_other@gmail.com'
    name 'test_user_other'
  end
end
