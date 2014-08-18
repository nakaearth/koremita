class SearchMovie
  include ActiveModel::Model

  attr_accessor :keyword

  validates presence: :keyword
  validates length: :keyword,  within: 3..20, too_long: '検索文字が長過ぎます', too_short: '検索文字が身近すぎます'
end
