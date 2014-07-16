# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  movie_id   :integer
#
# Indexes
#
#  index_comments_on_movie_id  (movie_id)
#  index_comments_on_user_id   (user_id)
#

class Comment < ActiveRecord::Base
  belongs_to :movies, dependent: :destroy
  belongs_to :users, dependent: :destroy

  validates :message, presence: true
end
