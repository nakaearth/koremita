# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_youtub, class: Youtub do
    title "test_youtub"
    url "http://test.youtub.jp/hogehoge/movie1"
  end
end
