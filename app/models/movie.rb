class Movie < ActiveRecord::Base
  belongs_to :user
  has_one :youtub

  validates :title , presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 500 }

end
