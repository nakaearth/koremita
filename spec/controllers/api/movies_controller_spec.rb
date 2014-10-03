require 'rails_helper'

module Api
  describe MoviesController, type: :controller do
    render_views

    let!(:current_user) { create(:current_user) }
    let!(:auth_provider) { create(:auth_provider, :facebook, user: current_user) }
    let!(:exec_time) { Time.zone.now }
    let!(:movies) { create_list(:test_movie, 30,  user: current_user, created_at: exec_time) }

    describe '最新の映画情報を表示' do
      context '1ページ目の場合' do
        before do
          get :index
        end

        it 'ステータス OK が返ってくる' do
          expect(response.status).to eq(200)
        end

        it '20件表示される' do
          expect(assigns[:movies]).not_to be_nil
          expect(assigns[:movies].size).to eq(20)
        end
      end

      context 'ページングする場合' do
        before do
          get :index, page: 2
        end

        it 'ステータス OK が返ってくる' do
          expect(response.status).to eq(200)
        end

        it '10件表示される' do
          expect(assigns[:movies]).not_to be_nil
          expect(assigns[:movies].size).to eq(10)
        end
      end
    end
  end
end
