require 'spec_helper'

describe SessionsController do
  render_views

  let!(:current_user) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, user: current_user) }

  describe 'アカウント情報取得の時に呼ばれるcreateメソッド' do
    context 'facebookログインの場合' do
      before do
        allow(controller).to receive(:current_user) { current_user }
        params =  { provider: current_user.auth_providers[0].provider,
                    info: { email: current_user.email,
                            name: current_user.name,
                            nickname: current_user.auth_providers[0].screen_name,
                            image: current_user.auth_providers[0].image_path
                           },
                    uid: current_user.auth_providers[0].uid,
                    credentials: { token: current_user.auth_providers[0].token }  }
        controller.request.env["omniauth.auth"] =  params
        post :create, params
      end

      it 'response status is 302.' do
        expect(response.status).to eql(302)
      end
      it 'render file is show' do
        expect(render_template 'top#index')
      end
    end
  end
end
