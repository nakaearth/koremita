# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_movie , class: Movie do
    sequence(:title) {  |n| "my mobie #{n}" }
    sequence(:image_url) {  |n| "http://test.hoge/test#{n}.jp" }
    description "test test test test"
    view_flag 1
    rate 1
  end
end
