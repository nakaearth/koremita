# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'rails_helper'

describe User do
  let!(:current_user) { create(:current_user) }
  let!(:auth_provider) { create(:auth_provider, user: current_user) }
  let!(:test_movie1) { create(:test_movie, user: current_user) }
  let!(:test_movie2) { create(:test_movie, user: current_user) }
  let!(:test_movie3) { create(:test_movie, user: current_user) }
  let!(:test_movie4) { create(:test_movie, user: current_user) }
  let!(:my_comments1) { create_list(:comment, 5, user: current_user) }

  # モデルの定義をチェック
  it { expect have_many(:movies) }
  it { expect validate_presence_of(:email) }
  it { expect validate_presence_of(:name) }
  it { expect(current_user.movies.size).to eq(4) }

  describe 'user モデル属性チェック' do
    context 'ログイン後' do
      before do
        @user = current_user
      end
      it 'email address' do
        expect(@user.email).to eq('test@gmail.com')
      end
    end
  end

  describe 'my_commentsという名前のアソシエーションをチェック' do
    context '自分のコメントを投稿している場合' do
      before do
        @user = current_user
      end
      it '自分が投稿したコメントが取得できる' do
        expect(@user.my_comments.size).to eq(5)
      end
    end
  end
end
