# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :current_user, class: User do
    email 'test@gmail.com'
    password 'test1234'    
  end
end
