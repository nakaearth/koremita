# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  view_flag   :integer
#  rate        :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  category    :string(255)
#  photo       :string(255)
#

require 'spec_helper'

describe Movie do

  let!(:current_user) { create(:current_user) }
  let!(:provider) { create(:auth_provider, user: current_user) }
  let!(:test_movie) { create(:test_movie, user: current_user) }
  let!(:test_movie2) { create(:test_movie, user: current_user) }
  let!(:test_movie3) { create(:test_movie, user: current_user) }
  let!(:test_movie4) { create(:test_movie, user: current_user) }

  describe '幾つかのテーブルと関連を持っている' do
    context 'have a relation to user class' do
      it { expect belong_to(:users) }
    end
  end

  describe '入力チェックをする' do
    context 'titleは必須' do
      it { expect validate_presence_of(:title) }
    end

    context 'descriptionは必須' do
      it { expect validate_presence_of(:desription) }
    end
  end
#  describe '全文検索' do
#    context 'タイトル検索' do
#      before do
#      end
#
#      it '該当するデータが取得できる' do
#        movies = Movie.search('movies', 'mobile')
#        expect(movies).not_to be_nil
#      end
#      it 'movieが登録されると全文検索の方にも登録される' do
#         movies = Movie.search('movies', 'mobile')
#         expect(movies.size).to eq(4)
#      end
#    end
#  end
end
