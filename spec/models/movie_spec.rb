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
