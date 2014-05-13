# == Schema Information
#
# Table name: youtubs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  movie_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_youtub, class: Youtub do
    title "test_youtub"
    url "http://test.youtub.jp/hogehoge/movie1"
  end
end
