require 'spec_helper'

describe Koremita::CommentsController do
  render_views

  let!(:current_user) { create(:current_user) }
  let!(:other_user) { create(:other_user) }
  let!(:auth_provider) { create(:auth_provider, user: current_user) }
  let!(:exec_time) { Time.zone.now }
  let!(:my_movie) { create(:test_movie, user: current_user, created_at: exec_time) }
  let!(:comments) { create_list(:comment, 5, movie: my_movie, user: other_user, created_at: exec_time) }
 

  describe '映画に関連するコメントの一覧情報を表示するindexメソッドを呼ぶ' do

    context 'ログインしているばあい' do
      let(:params) { { movie_id: my_movie.id } }
      before do
        @user = current_user
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
        get :index, params
      end
      it 'indexページに遷移する' do
        expect(render_template('index'))
      end
      it "returns http success" do
        expect(response.status).to eql(200)
      end
      it '映画にひもつくコメントが表示される' do
        expect(assigns[:movie].title).to eql(my_movie.title)
        expect(assigns[:movie].movie_comments.size).to eq(5)
      end
    end
  end
end
