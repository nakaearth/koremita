require 'spec_helper'

describe Koremita::MoviesController do

  let!(:current_user) { FactoryGirl.create(:current_user) }
  let!(:test_movie1) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie2) { FactoryGirl.create(:test_movie, user: current_user) }

  describe "GET 'index'" do
    context "index method test" do
      before do
        @user = current_user
        allow(controller).to receive(:current_user) { @user }
        get 'index'
      end
      it "returns http success" do
        response.should be_success
      end
    end
  end

end
