require 'spec_helper'

describe 'ユーザがfacebookログインする' do

  context 'トップページに遷移してfacebookログインボタンをクリックした時' do
    context 'ログインに成功した場合' do
      before do
         visit root_path
        click_link 'Facebookでログイン'
      end
      it 'トップページに遷移する' do
        expect(page.current_path).to eq '/auth/developer/callback'
      end
    end
  end
end
