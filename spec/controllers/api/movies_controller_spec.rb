require 'rails_helper'

describe Api::MoviesController, type: :controller do
  render_views

  let!(:current_user) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, :facebook, user: current_user) }
  let!(:users) { create_list(:current_user, 3) }
  let!(:friend_auth_provider) { create(:auth_provider, :facebook, user: users[0]) }
  let!(:friend_auth_provider2) { create(:auth_provider, :facebook, user: users[1]) }
  let!(:friend_auth_provider3) { create(:auth_provider, :facebook, user: users[2]) }
  let!(:exec_time) { Time.zone.now }
  let!(:movies) { create_list(:test_movie, 5,  user: users[0], created_at: exec_time) }
  let!(:movies2) { create_list(:test_movie, 8,  user: users[1], created_at: exec_time) }
  let!(:movies3) { create_list(:test_movie, 10,  user: users[2], created_at: exec_time) }
  let!(:mock_facebook_graph) { double(FacebookGraph) }
  let!(:friend_list) { [users[0].facebook_provider.uid, users[1].facebook_provider.uid, users[2].facebook_provider.uid] }

  describe '友人の映画一覧を返す' do
    context 'ログインしている場合' do
      before do
        @user = current_user
        allow(controller).to receive(:current_user) { current_user }
        allow(controller).to receive(:login?) { true }
        allow(mock_facebook_graph).to receive_messages(current_user_friends: friend_list)
        allow(FacebookGraph).to receive(:new).and_return(mock_facebook_graph)

        # get :index
      end

      it '映画の一覧を返す' do
      end

      it '友人をランダムに選んで返す' do
      end
    end
  end
end
