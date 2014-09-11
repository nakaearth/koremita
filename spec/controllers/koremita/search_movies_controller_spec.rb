require 'rails_helper'

describe Koremita::SearchMoviesController do
  render_views
  let!(:current_user) { create(:current_user) }

  describe '検索処理を実行した場合' do
    context 'データが複数ヒットするとした場合' do
      before do
        movie = SearchMovie.new
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
        allow(controller).to receive(:new_search_model) { movie }
        movies = create_list(:test_movie, 10)
        allow(Search::Connection.new).to receive(:search) { movies }
        params = { search_movie: { keyword: 'アクション' } }
        post :create, params
      end

      it 'レスポンス200が変える' do
        expect(response.status).to eq(200)
      end
    end
  end
end
