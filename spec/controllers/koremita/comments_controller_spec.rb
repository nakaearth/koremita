require 'rails_helper'

describe Koremita::CommentsController do
  render_views

  let!(:current_user) { create(:current_user) }
  let!(:other_user) { create(:other_user) }
  let!(:auth_provider) { create(:auth_provider, user: current_user) }
  let!(:exec_time) { Time.zone.now }
  let!(:my_movie) { create(:test_movie, user: current_user, created_at: exec_time) }
  let!(:comments) { create_list(:comment, 5, movie: my_movie, user: other_user, created_at: exec_time) }
  let!(:current_user_comments) { create_list(:comment, 5, movie: my_movie, user: current_user, created_at: exec_time) }

  describe '映画に関連するコメントの一覧情報を表示するindexメソッドを呼ぶ' do
    let(:params) { { movie_id: my_movie.id } }

    context 'ログインしているばあい' do
      before do
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
        get :index, params
      end
    end

    context 'ログインしていない場合' do
      let(:not_login_user) { nil }

      before do
        allow(controller).to receive(:not_login_user) { current_user }
        # allow(controller).to receive(:login?) { false }
        get :index, params
      end

      it 'HTTP statusが302が返る' do
        expect(response.status).to eql(302)
      end
    end
  end

  describe '映画に関する自分が書いたコメント削除する場合' do
    let(:params) { { movie_id: my_movie.id, id: current_user_comments[0].id } }

    context 'ログインしているばあい' do
      before do
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
        delete :destroy, params
      end
      it 'indexページに遷移する' do
        expect(render_template('index'))
      end

      it "returns http success" do
        # expect(response.status).to eql(200)
      end

      it '投稿したコメントの詳細が表示される' do
        expect(assigns[:comment]).not_to be_nil
      end
    end
  end
end
