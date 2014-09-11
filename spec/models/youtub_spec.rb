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

require 'rails_helper'

describe Youtub do
  let!(:current_user) { FactoryGirl.create(:current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_youtub) { FactoryGirl.create(:test_youtub, movie: test_movie) }

  it { expect belong_to(:test_movie) }
end
