# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  image_url   :string(255)
#  description :text
#  view_flag   :integer
#  rate        :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
require 'spec_helper'

describe Movie do

  let!(:current_user) { create(:current_user) }
  let!(:provider) { create(:auth_provider, user: current_user) }
  let!(:test_movie) { create(:test_movie, user: current_user) }
  let!(:test_movie2) { create(:test_movie, user: current_user) }
  let!(:test_movie3) { create(:test_movie, user: current_user) }
  let!(:test_movie4) { create(:test_movie, user: current_user) }

  describe "have a feature" do
    context "have a relation to user class" do
      it { expect belong_to(:users) }
    end

    context "is valid without title" do
      it { expect validate_presence_of(:title) }
    end

    context "is valid without description" do
      it { expect validate_presence_of(:desription) }
    end
  end

  describe "check the image url format" do
    before do
      @movie = test_movie
      @movie.image_url = "htt://hogehoge.test.jp/image.jpg"
      @movie2 = test_movie2
      @movie2.image_url = "http://hogehoge.test.jp/image.jpg"
    end
    context "is invalid format" do
      it { expect(@movie.errors_on(:image_url).size).to eql(1) }
    end

    context "is not  invalid format " do
      it { expect(@movie2).to be_valid }
    end
  end
end
