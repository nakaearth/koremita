class Youtub < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true, length: { maximum: 80 }
  validates :url, presence: true
end
