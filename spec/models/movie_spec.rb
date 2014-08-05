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
  let!(:other_users) { create_list(:other_user, 3) }
  let!(:provider) { create(:auth_provider, user: current_user) }
  let!(:test_movies) { create_list(:test_movie, 4, user: current_user) }
  let!(:movie_comment1) { create(:comment, movie: test_movies[0], user: other_users[0]) }
  let!(:movie_comment2) { create(:comment, movie: test_movies[0], user: other_users[1]) }
  let!(:movie_comment3) { create(:comment, movie: test_movies[1], user: other_users[2]) }

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

  describe '映画に投稿されたコメント一覧を取得' do
    context 'コメントが何件か投稿されている場合' do
      it { expect(test_movies[0].movie_comments.count).to eq(2) }
      it { expect(test_movies[1].movie_comments.count).to eq(1) }
    end
  end
end
