# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  view_flag   :integer
#  rate        :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  category    :string(255)
#  photo       :string(255)
#

class Movie < ActiveRecord::Base
  include Searchable

  after_save :create_search_data

  belongs_to :user
  has_one :youtub
  has_many :movie_comments, class_name: Comment

  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 500 }

  def create_search_data
    Searchable.add("movies", id.to_s, title)
  end
end
