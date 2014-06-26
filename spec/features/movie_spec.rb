require 'spec_helper'

describe 'ユーザがfacebookログインしている', type: :feature do
  let!(:current_user) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, :developer,  user: current_user) }
  let!(:movies) { create_list(:test_movie, 30, user: current_user) }

  context 'トップページに遷移して映画一覧クリックした時' do
    before do
      ApplicationController.any_instance.stub(:current_user).and_return(current_user)
      visit root_path
#      click_link 'Facebookでログイン'
      click_link '映画一覧'
    end
    it '映画一覧画面が表示' do
      expect(page.current_path).to eq '/koremita/movies'
    end
    it 'ユーザの情報が表示される' do
      expect(page).to have_content 'test@gmail.com'
    end
#    it '映画の一覧で表示される' do
#      expect(page).to have_content 'my mobie'
#    end
  end
end
