require 'spec_helper'

describe 'ユーザがfacebookログインしていてtopページをみる', type: :feature do
  let!(:current_user) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, :developer,  user: current_user) }
  let!(:movies) { create_list(:test_movie, 30, user: current_user) }

  context 'トップページを表示している' do
    before do
      ApplicationController.any_instance.stub(:current_user).and_return(current_user)
    end
    it '映画一覧画面が表示' do
      visit root_path
      expect(page).to have_content '映画一覧'
      # click_link '映画一覧'
      page.save_screenshot 'movie_screenshot1.png'
      expect(page.current_path).to eql '/'
      # expect(page.current_path).to eql '/koremita/movies'
    end
    it 'ユーザの情報が表示される' do
      visit root_path
      # click_link '映画一覧'
      page.save_screenshot 'movie_screenshot2.png'
      expect(page).to have_content 'test@gmail.com'
    end
  end

  context 'koremita/movies以下を表示' do
    before do
      ApplicationController.any_instance.stub(:current_user).and_return(current_user)
    end

    it 'userにひもつく映画一覧が表示' do
      visit koremita_movies_path
      expect(page).to have_content '映画一覧'
    end
  end
end
