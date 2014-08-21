class SearchMovie
  include ActiveModel::Model

  attr_accessor :title, :description

  validates :title, length: { within: 3..20, too_long: '検索文字が長過ぎます', too_short: '検索文字が身近すぎます' }
end
