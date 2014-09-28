require 'rails_helper'

describe TopController, type: :controller do
  render_views

  let!(:user1) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, :facebook, user: user1) }
  let!(:movies) { create_list(:test_movie, 5, user: user1) }

  describe "GET 'index'" do
    context 'movieが複数ある場合' do
      before do
        get :index
      end

      it 'returns http success' do
        expect(response).to be_success
      end

      it '5件movieの情報を表示する' do
        expect(assigns[:movies]).not_to be_nil
        expect(assigns[:movies].size).to eq(5)
      end
    end
  end
end
