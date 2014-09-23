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
    sequence(:email) { |n| "test#{n}@gmail.com" }
    name 'test_user'
  end

  factory :other_user, class: User do
    sequence(:email) { |n| "test_other#{n}@gmail.com" }
    sequence(:name) { |n| "test_user_other#{n}" }
  end
end
