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

class Youtub < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true, length: { maximum: 80 }
  validates :url, presence: true
end
