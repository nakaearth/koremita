# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  view_flag   :integer
#  rate        :integer
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  category    :string(255)
#  photo       :string(255)
#
# Indexes
#
#  index_movies_on_user_id  (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_movie, class: Movie do
    sequence(:title) {  |n| "my mobie #{n}" }
    sequence(:photo) {  |n| "http://test.hoge/test#{n}.jp" }
    description "test test test test"
    view_flag 1
    rate 1
    category 'drama'
  end
end
