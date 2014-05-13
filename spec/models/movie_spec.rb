# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  image_url   :string(255)
#  description :text
#  view_flag   :integer
#  rate        :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Movie do

  let!(:current_user) { FactoryGirl.create(:current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }

  it { expect belong_to(:users) }
  it { expect validate_presence_of(:title) }
  it { expect validate_presence_of(:desription) }
end
