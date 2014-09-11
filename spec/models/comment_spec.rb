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

require 'rails_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
