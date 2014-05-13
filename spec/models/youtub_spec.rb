require 'spec_helper'

describe Youtub do
  let!(:current_user) { FactoryGirl.create(:current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_youtub) { FactoryGirl.create(:test_youtub, movie: test_movie) }

  it { expect belong_to(:test_movie) }
end
