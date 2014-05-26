require 'spec_helper'

describe Koremita::MoviesController do
  render_views

  let!(:current_user) { FactoryGirl.create(:current_user) }
  let!(:test_movie1) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie2) { FactoryGirl.create(:test_movie, user: current_user) }

  describe "GET 'index' method" do
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

  describe "Get 'my_movies' method" do
    context "current_userのmoviesについて" do
      before do
        allow(controller).to receive(:current_user) { current_user }
        get 'my_movies'
      end
      it { response.should be_success }
      it { expect(current_user.movies).not_to be_nil }
      it { expect(current_user.movies.size).to eql(2) }
      it { expect(render_with_layout 'application') }
      it { expect(render_template 'my_movies') }
      it { expect(get: 'koremita/movies/my_movies').to route_to(controller: 'koremita/movies', action: 'my_movies') }
    end
  end

  describe "Post" 'create method' do
    context "is invalid inupt paramaeter" do
      before do
        allow(controller).to receive(:current_user) { current_user }
        params =  { movie: { title: 'test movie', image_url: 'http://test.com/hoge.jpg',  description: 'test test test', rate: 100 }, youtub: { title: 'test youtub', url: 'http://hogehoge.jp/test.mp3' } }
        post :create, params
      end

      it "response status is 302." do
        expect(response.status).to eql(302) 
      end
      it "render file is show" do
        expect(render_template 'show')
      end
    end
  end
end
