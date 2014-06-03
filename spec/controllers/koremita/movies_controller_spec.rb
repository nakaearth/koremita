require 'spec_helper'

describe Koremita::MoviesController do
  render_views

  let!(:current_user) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, user: current_user) }
  let!(:test_movie1) { create(:test_movie, user: current_user) }
  let!(:test_movie2) { create(:test_movie, user: current_user) }

  describe 'ユーザの映画一覧情報を表示するindexメソッドを呼ぶ' do
    context 'ログインしているばあい' do
      before do
        @user = current_user
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
        get 'index'
      end
      it 'indexページに遷移する' do
        expect(render_template('index'))
      end
      it "returns http success" do
        expect(response.status).to eql(200)
      end
    end

    context '未ログインの場合' do
      it 'top#indexに遷移する' do
        expect(render_template('top#index'))
      end
    end
  end

  describe 'ログインしたユーザの映画一覧情報を表示するmy_moviesメソッドを呼ぶ' do
    context 'ログインしている場合' do
      before do
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
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

  describe '映画情報を登録する時に呼ばれるcreate' do
    context '渡されるパラメータが不正の場合' do
      before do
        allow(controller).to receive(:current_user) { current_user }
        params =  { movie: { title: 'test movie', image_url: 'http://test.com/hoge.jpg',  description: 'test test test', rate: 100 }, youtub: { title: 'test youtub', url: 'http://hogehoge.jp/test.mp3' } }
        post :create, params
      end

      it 'response status is 302.' do
        expect(response.status).to eql(302)
      end
      it 'render file is show' do
        expect(render_template 'show')
      end
    end
  end
end
